# frozen_string_literal: true
require_relative '../../spec/spec_helper'

RSpec.describe 'compare superheroes' do
  before(:each) do
    superman = Superhero.new(name: 'Superman',
                             strength: 100,
                             agility: 100,
                             intelligence: 50)

    batman = Superhero.new(name: 'Batman',
                           strength: 75,
                           agility: 75,
                           intelligence: 80)

    wonder_woman = Superhero.new(name: 'Wonder Woman',
                                 strength: 100,
                                 agility: 100,
                                 intelligence: 100)

    @team = Team.new(superman, batman, wonder_woman)
  end

  it 'select' do
    strongest_heroes = @team.select do |hero|
      hero.strength == 100
    end

    expect(strongest_heroes.size).to eq(2)
  end

  it 'reduce' do
    total_intelligence = @team.custom_reduce(0) do |sum, hero|
      sum + hero.intelligence
    end

    expect(total_intelligence).to eq(230)
  end

  it 'maxmin' do
    maxmin = @team.maxmin

    expect(maxmin.min.name).to eq('Superman')
    expect(maxmin.max.name).to eq('Wonder Woman')
  end
end
