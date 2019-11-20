# frozen_string_literal: true

# You can find Language using negative search   
class FindByNegativeValueService   

    def self.step_to_next   
      @current_el += 1
      if @collection[@current_el]
        handle_next_collection_element(@current_el)           
      end   
    end

    def self.handle_next_collection_element(position)
      @res<<@collection[position]["Name"]
      @collection[position].each do |key, val|      

        val.downcase.split(',').each do |el| 
          el = el.strip
          if el == @minus
            @res.delete(@collection[position]["Name"])
            step_to_next 
          end  
        end      

        step_to_next
      end     
    end   

  def self.call(collection, phrase_with_minus)
    @collection = collection  
    @res = []
    @current_el = 0 
    @minus = ''

    phrase_with_minus.downcase!
    phrase_last_el = phrase_with_minus.length - 1
    phrase_index = phrase_with_minus.index('-') 

    if phrase_index
      @minus = phrase_with_minus[phrase_index+1..phrase_last_el]
      match_phrase = phrase_with_minus[0...phrase_index-1]
    else    
      match_phrase = phrase_with_minus
    end      



 

    handle_next_collection_element(@current_el)

    array_of_langs = FindByMatchService.call(@collection, match_phrase)
    (@res & array_of_langs).join(', ')
  
  end

end
