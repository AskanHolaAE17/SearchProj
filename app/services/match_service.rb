# frozen_string_literal: true

class MatchService     

  def self.call(collection, match_phrase)
    res = []

    match_phrase.downcase!

    if (1..3).include?(match_phrase.split(' ').count)

      collection.each do |h|
        h.each do |key, val|
         
          val.downcase.split(',').each do |el| 
            el = el.strip
            res << h["Name"] if el.include? match_phrase 
          end  

        end
      end
      res.uniq.join(', ')
    else 
      'Wrong statement.' 
    end            
  end    

end
