# frozen_string_literal: true

# You can find Language by designer, language name or type
class FindByService     

  def self.call(collection, str, field_name)
    res = []   

    if (1..3).include?(str.split(' ').count)
  
      collection.each do |h|
        split_part = h["#{field_name}"].downcase.split(',')   
        split_part = split_part

        split_part.each do |dby|

          pre = dby.downcase.split(' ')
          dby_variants = "#{pre.join(' ')}" + 
                  "#{pre[2] if pre[2]} " + 
                  "#{pre[0]} " + 
                  "#{pre[1] if pre[1]} "+ 
                  "#{pre[2] if pre[2]}" + 
                  "#{pre[1] if pre[1]} " + 
                  "#{pre[0] if pre[0]} " + 
                  "#{pre[2] if pre[2]} " + 
                  "#{pre[1] if pre[1]} " + 
                  "#{pre[2] if pre[2]} "  + 
                  "#{pre[0] if pre[0]}"    
          res << h["Name"] if dby_variants.include? str
        end
      end
      res.uniq.join(', ')
    else 
      'Wrong statement.' 
    end    
  end  

end
