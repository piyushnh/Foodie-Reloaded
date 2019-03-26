import React from "react";
import { Route, Switch } from "react-router-dom";

import Users from './components/users' ;
import Contact from './components/contact' ;
import Login from "./containers/Login";
import Signup from "./containers/Signup";

const BaseRouter = () => (
  <Switch>
      <Route path="/users/" component={Users} />
      <Route path="/contact/" component={Contact} />
      <Route exact path="/login/" component={Login} />
      <Route exact path="/signup/" component={Signup} />
  </Switch>
);

export default BaseRouter;
