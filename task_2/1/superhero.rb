
# frozen_string_literal: true
class Superhero
  include Comparable
  attr_reader :name, :strength, :agility, :intelligence

  def initialize(characteristics)
    @name         = characteristics[:name]
    @strength     = characteristics[:strength]
    @agility      = characteristics[:agility]
    @intelligence = characteristics[:intelligence]
  end

  def average
    attributes = [strength, agility, intelligence]
    attributes.inject(:+) / attributes.size
  end

  def <=>(other)
    return nil unless other.is_a?(self.class)
    average <=> other.average
  end
end
