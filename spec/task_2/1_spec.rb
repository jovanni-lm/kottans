# frozen_string_literal: true
require_relative 'app'

RSpec.describe 'compare superheroes' do
  before(:each) do
    @superman = Superhero.new(name: 'Superman',
                              strength: 100,
                              agility: 100,
                              intelligence: 50)

    @batman = Superhero.new(name: 'Batman',
                            strength: 75,
                            agility: 75,
                            intelligence: 80)

    @ivo_bobul = Superhero.new(name: 'Ivo Bobul',
                               strength: 100,
                               agility: 100,
                               intelligence: 100)
  end

  it 'compares superheroes' do
    expect(@superman.average).to eq(83)
    expect(@batman.average).to eq(76)
    expect(@superman <=> @batman).to eq(1)
  end

  it 'list of heroes sorted by average stats' do
    superheroes = Superheroes.new(@superman, @batman, @ivo_bobul)

    expect(superheroes.first.name).to eq('Superman')

    superheroes.sort_list!

    expect(superheroes.first.name).to eq('Batman')
    expect(superheroes.max.name).to eq('Ivo Bobul')
  end

  it 'list of heroes sorted by strength' do
    superheroes = Superheroes.new(@superman, @batman, @ivo_bobul)

    expect(superheroes.first.name).to eq('Superman')

    superheroes.sort_list!('intelligence')

    expect(superheroes.first.name).to eq('Superman')
  end
end
