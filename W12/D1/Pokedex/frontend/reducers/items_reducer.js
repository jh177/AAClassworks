import { RECEIVE_ITEMS, RECEIVE_POKEMON } from "../actions/pokemon_actions";

export const itemsReducer = (state={}, action) => {
  Object.freeze(state)
  switch (action.type) {
    case RECEIVE_ITEMS:
      return Object.assign({}, action.items, state);
    case RECEIVE_POKEMON:
      let nextState = action.payload.items
      return nextState
    default:
      return state
  }
}