export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}


export const itemsByPokemonId = (state, pokemon) => {
  let items = Object.values(state.entities.items);
  return items.filter(item=>item.pokemonId===pokemon.id)
}