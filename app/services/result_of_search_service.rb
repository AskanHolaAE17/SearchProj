# frozen_string_literal: true

# Call the right ServiceObject to handle the input data
class ResultOfSearchService     

  def self.call(search_style, collection, phrase)
    case search_style
    when 'match'
      # You can find languages by match precision of the field
      FindByMatchService.call(collection, phrase).join(', ') 
           
    when 'by_lang'
      # You can find Language by name of language:
      FindByService.call(collection, phrase, 'Name') 
           
    when 'by_type'
      # You can find Language by type
      FindByService.call(collection, phrase, 'Type') 
            
    when 'by_designer'
      # You can find Language by designer's name 
      FindByService.call(collection, phrase, 'Designed by') 
        
    when 'negative'
      # Negative search    
      FindByNegativeValueService.call(collection, phrase)                
    end   
  end

end
