# frozen_string_literal: true

# You can find Language by designer, language name or type
class FindByService     

  def self.call(collection, search_phrase, field_name)
    resulted_languages = []   

    collection.each do |hash_of_data|
    
      # Define part for comparing:
      part_for_comparing = hash_of_data["#{field_name}"].downcase.split(',')   

      part_for_comparing.each do |string_of_current_values|
        
        # Array of splitted part for comparing:
        arr = string_of_current_values.split(' ')
        variants_for_search = CountVariantsForFindByObject.call(arr)   
                       
        # Put the name of current language into resulted array:               
        resulted_languages << hash_of_data["Name"] if variants_for_search.include? search_phrase
      end
    end
    
    resulted_languages.uniq.join(', ')  
  end  
  
end
