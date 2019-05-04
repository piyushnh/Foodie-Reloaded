import React from "react";
import { Route, Switch } from "react-router-dom";

import Users from './components/users' ;
import {FoodCourtRestaurantList} from "./components/FoodCourtListItem";
import FoodCourtList from "./containers/FoodCourtList";
import Login from "./containers/Login";
import Signup from "./containers/Signup";

const BaseRouter = () => (
  <Switch>
      <Route exact path="/users/" component={Users} />
      <Route exact path="/nearbyfoodcourts/" component={FoodCourtList} />
      <Route exact path="/login" component={Login} />
      <Route exact path="/signup" component={Signup} />
      <Route exact path='/nearbyfoodcourts/:food_name' name="food_court_restaurants" component={FoodCourtRestaurantList} />

  </Switch>
);

export default BaseRouter;
