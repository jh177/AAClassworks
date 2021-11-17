import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import { Route, Switch, Routes} from "react-router-dom";
import LoginFormContainer from "./session/login_form_container";
import SignupFormContainer from "./session/signup_form_container";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer/>
    </header>

    {/* below code doesn't work for me under react-router-dom v6.0.2 */}
      {/* <Route path="/signup" component={SignupFormContainer} />
      <Route path="/login" component={LoginFormContainer} /> */}

    {/* below code works for me under react-router-dom v6.0.2 */}
    <Routes>
      <Route path="/signup" element={<SignupFormContainer/>} />
      <Route path="/login" element={<LoginFormContainer/>} />
    </Routes>

  </div>
);

export default App;