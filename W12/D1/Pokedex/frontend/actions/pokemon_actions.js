import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";
export const RECEIVE_ITEMS = 'RECEIVE_ITEMS';
export const RECEIVE_MOVES = 'RECEIVE_MOVES';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
})

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const receivePokemon = (payload) => ({
  type: RECEIVE_POKEMON,
  payload
})

export const requestSinglePokemon = (pokemonId) => (dispatch) => (
  APIUtil.getPokemon(pokemonId)
    .then(payload => {
      dispatch(receivePokemon(payload))
      // dispatch(receiveItems(response.items))
      // dispatch(receiveMoves(response.moves))
    })
)

export const receiveItems = (items) => ({
  type: RECEIVE_ITEMS,
  items
})

export const receiveMoves = (moves) => ({
  type: RECEIVE_MOVES,
  moves
})



