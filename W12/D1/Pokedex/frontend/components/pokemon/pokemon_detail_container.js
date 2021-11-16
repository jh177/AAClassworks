import { connect } from "react-redux"
import { requestSinglePokemon } from "../../actions/pokemon_actions"
import PokemonDetail from "./pokemon_detail"

export const mapSTP = (state) => ({
  pokemon: state.entities.pokemon,
  items: state.entities.items,
  moves: state.entities.moves
})

export const mapDTP = (dispatch) => ({
  requestSinglePokemon: (id)=>dispatch(requestSinglePokemon(id))
})

export default connect(mapSTP, mapDTP)(PokemonDetail)