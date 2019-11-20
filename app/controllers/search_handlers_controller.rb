class SearchHandlersController < ApplicationController

  def index
    @file         = File.read('public/data.json')
    @json         = JSON.parse(@file)
    @json_pretty  = JSON.pretty_generate(@json)
    
    @result       = 'Поле для виводу результатiв' 
  end

  def match 
    @search_style = params['search_style']
    @collection   = JSON.parse(params[:json])
    @phrase       = params[:phrase].downcase    
        
    @result       = if (1..3).include?(@phrase.split(' ').count)     
                      # If the length of input match_phrase is less than 4 words   
                      # Call the right ServiceObject to handle the input data:
                      ResultOfSearchService.call(@search_style, @collection, @phrase)       
                    else
                      'Match phrase has wrong length.'  
                    end  
  end  
  
end
