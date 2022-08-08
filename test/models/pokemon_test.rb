require "test_helper"

class PokemonTest < ActiveSupport::TestCase

  def test_attributes
    %w(name type_1 type_2 total hp attack defense sp_atk sp_def speed generation legendary).each do |attribute|
      assert Pokemon.attribute_names.include? attribute
    end
  end

  def test_attributes_must_be_present

    Pokemon.attribute_names.each do |attribute|
      next if ['id', 'created_at', 'updated_at', 'type_2'].include?(attribute)
      pokemon = Pokemon.new({attribute => nil})

      assert pokemon.invalid?
      assert pokemon.errors.include?(attribute)
    end
  end

  def test_type_2_not_must_be_present

    pokemon_attributes = pokemons(:four).attributes.except('id', 'created_at', 'updated_at')
    pokemon_attributes['type_2'] = nil

    pokemon = Pokemon.new(pokemon_attributes)

    assert pokemon.valid?
    assert pokemon.errors.exclude?('type_2')
  end
end
