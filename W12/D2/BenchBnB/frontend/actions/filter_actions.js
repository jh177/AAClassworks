
export const UPDATE_BOUNDS = "UPDATE_BOUNDS"

const updateBounds = (bounds) => dispatch => ({
  type: UPDATE_BOUNDS,
  bounds
})