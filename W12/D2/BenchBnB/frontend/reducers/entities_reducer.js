import { combineReducers } from "redux";
import benchesReducer from "./bench_reducer";
import usersReducer from './users_reducer'

const entitiesReducer = combineReducers({
  users: usersReducer,
  benches: benchesReducer
});

export default entitiesReducer;