import React from "react";
import { connect } from "react-redux";
// import { Route, useNavigate, Navigate, useParams, useLocation} from "react-router";
import {withRouter, Route, Redirect} from 'react-router-dom'


const Auth = ({ component: Component, path, loggedIn, exact }) => (
  <Route
    path={path}
    exact={exact}
    render={props =>
      !loggedIn ? <Component {...props} /> : <Redirect to="/" />
    }
  />
);

const mapStateToProps = state => {
  return { loggedIn: Boolean(state.session.id) };
};

export const AuthRoute = withRouter(
  connect(
    mapStateToProps,
    null
  )(Auth)
);