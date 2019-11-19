require 'json'

class SearchHandlersController < ApplicationController

  def index
    file = File.read('public/data.json')
    @json = JSON.parse(file)
    @json_pretty = JSON.pretty_generate(@json)
    
    @result = 'Поле для виводу результатiв'
  end

  def match 
    @string = 'string'
        
    @result = case params['search_style']
    when 'match'
      MatchService.call(@string)
    when 'by_lang'
      #
    when 'by_type'
      # 
    when 'by_designer'
      # 
    when 'negative'
      #                    
    end        
    redirect_to 'https://google.com.ua/' if @result == 'Match'    
  end  
end
