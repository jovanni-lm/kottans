# frozen_string_literal: true
require_relative '../../task_2/1/superhero'
require_relative 'custom_enumerable'

# Base team class
class Team
  include CustomEnumerable
  attr_accessor :heroes

  def initialize(*heroes)
    @heroes = heroes
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    heroes.each(&block)
  end
end
