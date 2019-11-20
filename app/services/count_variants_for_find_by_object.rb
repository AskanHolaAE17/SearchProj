# frozen_string_literal: true

# Count variants for comparing with input phrase
class CountVariantsForFindByObject

  def self.call(arr)
    "#{arr.join(' ')}"     + 
    "#{arr[2] if arr[2]} " + 
    "#{arr[0]} "           + 
    "#{arr[1] if arr[1]} " + 
    "#{arr[2] if arr[2]}"  + 
    "#{arr[1] if arr[1]} " + 
    "#{arr[0] if arr[0]} " + 
    "#{arr[2] if arr[2]} " + 
    "#{arr[1] if arr[1]} " + 
    "#{arr[2] if arr[2]} " + 
    "#{arr[0] if arr[0]}" 
  end  
  
end
