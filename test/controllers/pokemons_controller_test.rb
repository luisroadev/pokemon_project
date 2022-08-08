require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = pokemons(:one)
  end

  test "should get index" do
    get pokemons_url, as: :json
    assert_response :success
  end

  test "should get index with pagination" do
    get pokemons_url({page: 1, per_page: 5}), as: :json
    assert_equal(JSON.parse(response.body).count , 5)
    assert_response :success

    get pokemons_url({page: 2, per_page: 5}), as: :json
    assert_equal(JSON.parse(response.body).count , 5)
    assert_response :success

    #returns 1 element because we have 11 pokemons in the test env
    get pokemons_url({page: 3, per_page: 5}), as: :json
    assert_equal(JSON.parse(response.body).count , 1)
    assert_response :success

    get pokemons_url({page: 1, per_page: 10}), as: :json
    assert_equal(JSON.parse(response.body).count , 10)
    assert_response :success
  end

  test "should create pokemon" do
    assert_difference("Pokemon.count") do
      post pokemons_url, params: { pokemon: { attack: @pokemon.attack, defense: @pokemon.defense, generation: @pokemon.generation, hp: @pokemon.hp, legendary: @pokemon.legendary, name: @pokemon.name, sp_atk: @pokemon.sp_atk, sp_def: @pokemon.sp_def, speed: @pokemon.speed, total: @pokemon.total, type_1: @pokemon.type_1, type_2: @pokemon.type_2 } }, as: :json
    end

    assert_response :created
  end

  test "should show pokemon" do
    get pokemon_url(@pokemon), as: :json
    assert_response :success
  end

  test "should update pokemon" do
    patch pokemon_url(@pokemon), params: { pokemon: { attack: @pokemon.attack, defense: @pokemon.defense, generation: @pokemon.generation, hp: @pokemon.hp, legendary: @pokemon.legendary, name: @pokemon.name, sp_atk: @pokemon.sp_atk, sp_def: @pokemon.sp_def, speed: @pokemon.speed, total: @pokemon.total, type_1: @pokemon.type_1, type_2: @pokemon.type_2 } }, as: :json
    assert_response :success
  end

  test "should destroy pokemon" do
    assert_difference("Pokemon.count", -1) do
      delete pokemon_url(@pokemon), as: :json
    end

    assert_response :no_content
  end
end
