# frozen_string_literal: true

# You can find Language using negative search   
class FindByNegativeValueService   

   

  def self.call(collection, phrase_with_minus)  
    resulted_languages = []
    current_element_position = 0 
    minus = ''

    phrase_with_minus.downcase!
    phrase_last_el = phrase_with_minus.length - 1
    phrase_index = phrase_with_minus.index('-') 

    if phrase_index
      minus = phrase_with_minus[phrase_index+1..phrase_last_el]
      match_phrase = phrase_with_minus[0...phrase_index-1]
    else    
      match_phrase = phrase_with_minus
    end      

    NextElementOfNegativeSearchService.call(collection, resulted_languages, current_element_position, minus)

    array_of_langs = FindByMatchService.call(collection, match_phrase)
    (resulted_languages & array_of_langs).join(', ')
  
  end

end
