require 'json'

class SearchHandlersController < ApplicationController

  def index
    file = File.read('public/data.json')
    @json = JSON.parse(file)
    @json_pretty = JSON.pretty_generate(@json)
    
    @result = 'Поле для виводу результатiв' 
  end

  def match 
    @class = 'bg-success text-white'
  
    @phrase     = params[:phrase]
    @collection = JSON.parse(params[:json])
        
    @result     = case params['search_style']
    when 'match'
      # You can find languages by match precision of the field
      MatchService.call(@collection, @phrase)      
    when 'by_lang'
      #
    when 'by_type'
      # 
    when 'by_designer'
      # 
    when 'negative'
      #                    
    end        
  end  
end
