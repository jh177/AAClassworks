export const fetchAllPokemon = () => (
  $.ajax({
    method: "get",
    url: "/api/pokemon"
  })
)

