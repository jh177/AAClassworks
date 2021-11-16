import React from "react";

class PokemonDetail extends React.Component{
  constructor(props){
    super(props)
  }

  componentDidMount(){
    this.props.requestSinglePokemon(this.props.match.params.id);
  }

  render(){
    let poke = this.props.pokemon[this.props.match.params.id]
    let moves = Object.values(this.props.moves)
    let items = Object.values(this.props.items)
    if (poke){
      return (
        <div>
          <img src={poke.imageUrl} alt="" />
          <h1>{poke.name}</h1>
          <ul>
            <li>Type: {poke.pokeType}</li>
            <li>Attack: {poke.attack}</li>
            <li>Defense: {poke.defense}</li>
          </ul>
          <ul>
            Moves: {moves.map(move => <li>{move.name}</li>)}
          </ul>
          <ul>
            <label>Items</label>
            Moves: {items.map(item => 
              <img src={item.imageUrl}/>
              )}
          </ul>
        </div>
      )
    } else {
      return null;
    }
  }
}

export default PokemonDetail;