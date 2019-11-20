class SearchHandlersController < ApplicationController

  def index
    file = File.read('public/data.json')
    @json = JSON.parse(file)
    @json_pretty = JSON.pretty_generate(@json)
    
    @result = 'Поле для виводу результатiв' 
  end

  def match 
    @phrase     = params[:phrase].downcase
    @collection = JSON.parse(params[:json])
        
    @result     = case params['search_style']
    when 'match'
      # You can find languages by match precision of the field
      FindByMatchService.call(@collection, @phrase).join(', ')      
    when 'by_lang'
      # You can find Language by name of language:
      FindByService.call(@collection, @phrase, 'Name')      
    when 'by_type'
      # You can find Language by type
      FindByService.call(@collection, @phrase, 'Type')       
    when 'by_designer'
      # You can find Language by designer's name 
      FindByService.call(@collection, @phrase, 'Designed by')   
    when 'negative'
      # Negative search    
      FindByNegativeValueService.call(@collection, @phrase)                
    end        
  end  
end
