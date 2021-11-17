import React from "react";
import GreetingContainer from "./greeting/greeting_container";
// import { Route, Switch, Routes} from "react-router-dom";
import { Route, Switch} from "react-router-dom";
import LoginFormContainer from "./session/login_form_container";
import SignupFormContainer from "./session/signup_form_container";
import { AuthRoute } from "../util/route_util";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer/>
    </header>

    {/* below code doesn't work for me under react-router-dom v6.0.2 */}
      <AuthRoute path="/signup" component={SignupFormContainer} />
      <AuthRoute path="/login" component={LoginFormContainer} />

    {/* below code works for me under react-router-dom v6.0.2 */}
    {/* <Routes>
      <AuthRoute path="/signup" element={<SignupFormContainer/>} />
      <AuthRoute path="/login" element={<LoginFormContainer/>} />
    </Routes> */}

  </div>
);

export default App;