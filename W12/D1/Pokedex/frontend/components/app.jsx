import { Route } from "react-router-dom"
import React from "react";
import PokemonIndexContainer from './pokemon/pokemon_index_container'
import PokemonDetailContainer from './pokemon/pokemon_detail_container'

const App = () => (
  <div>
    <Route path="/pokemon/:id" component={PokemonDetailContainer}/>
    <Route path="/" component={PokemonIndexContainer} />
  </div>
)

export default App;