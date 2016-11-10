
# frozen_string_literal: true
# Base superheroes class
class Superheroes
  include Enumerable
  attr_reader :list

  def initialize(*heroes)
    @list = heroes
  end

  def sort_list!(sort = 'average')
    @list = list.sort_by(&sort.to_sym)
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    list.each(&block)
  end

  def display_list
    list.map { |hero| puts hero.name }
  end
end
