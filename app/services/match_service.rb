# frozen_string_literal: true

class MatchService < ApplicationService

  def initialize(string)
    @string = string
  end
  
  def call(string)
    'Match'
  end

end
