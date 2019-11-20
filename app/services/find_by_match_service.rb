# frozen_string_literal: true

# You can find languages by match precision of the field
class FindByMatchService     

  def self.call(collection, match_phrase)
    resulted_languages = []

    collection.each do |hash_of_data|
      hash_of_data.each do |key, val|
          
        # Comparing every language, designer and type with match_phrase:
        val.downcase.split(',').each do |element| 
          element = element.strip
            
          if element.include? match_phrase 
            # Put the name of current language into resulted array
            resulted_languages << hash_of_data["Name"] 
          end
            
        end  
      end
    end  
    resulted_languages.uniq            
  end    

end
