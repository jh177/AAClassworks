import { connect } from "react-redux";
import Search from "./search";
import { fetchBenches } from "../../actions/bench_actions";

const mSTP = (state) => ({
  benches: Object.values(state.entities.benches),

})

const mDTP = (dispatch) => ({
  fetchBenches: () => dispatch(fetchBenches())
})

export default connect(mSTP, mDTP)(Search)