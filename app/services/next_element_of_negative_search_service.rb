# frozen_string_literal: true

# Get the next element for negative search  
class NextElementOfNegativeSearchService

  def self.call(collection, resulted_languages, current_element_position, minus)
    resulted_languages<<collection[current_element_position]["Name"]
    collection[current_element_position].each do |key, val|      

      val.downcase.split(',').each do |el| 
        el = el.strip
          
        resulted_languages.delete(collection[current_element_position]["Name"]) if el == minus
      end      
        
      if collection[current_element_position+1]
        current_element_position += 1
        NextElementOfNegativeSearchService.call(current_element_position, resulted_languages, current_element_position, minus)           
      end
        
    end 
    resulted_languages
  end    

end
