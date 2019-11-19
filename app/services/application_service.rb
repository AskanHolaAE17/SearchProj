# frozen_string_literal: true

# Class for declaration of variables
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

end
