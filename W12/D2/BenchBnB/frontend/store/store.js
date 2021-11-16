import { createStore, applyMiddleware } from "redux";
import rootReducer from "../reducers/rootReducer";
import logger from "redux-logger";
import thunk from '../middleware/thunk'

const configureStore = (preloadedState = {}) => createStore(
  rootReducer, preloadedState, applyMiddleware(thunk, logger)
);

export default configureStore;