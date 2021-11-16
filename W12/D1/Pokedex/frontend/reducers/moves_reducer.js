import { RECEIVE_MOVES, RECEIVE_POKEMON } from "../actions/pokemon_actions";

export const movesReducer = (state = {}, action) => {
  Object.freeze(state)
  switch (action.type) {
    case RECEIVE_MOVES:
      return Object.assign({}, action.moves, state);
    case RECEIVE_POKEMON:
      let nextState = action.payload.moves
      return nextState
    default:
      return state
  }
}