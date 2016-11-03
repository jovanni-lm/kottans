class Human
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def invite(person)
    person
  end

  def to_drink(drink)
    puts "#{name} agrees to drink some #{drink.name} with you!"
  end
end

class Drink
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mykola = Human.new('Mykola')
gordon = Human.new('Gordon Freeman')
beer = Drink.new('Beer')

mykola.invite(gordon).to_drink beer
