import { connect } from "react-redux";
import Search from "./search";
import { fetchBenches } from "../../actions/bench_actions";
import {updateBounds} from "../../actions/filter_actions"

const mSTP = (state) => ({
  benches: Object.values(state.entities.benches),

})

const mDTP = (dispatch) => ({
  fetchBenches: (filters) => dispatch(fetchBenches(filters)),
  updateBounds: (bounds) => dispatch(updateBounds(bounds))
})

export default connect(mSTP, mDTP)(Search)