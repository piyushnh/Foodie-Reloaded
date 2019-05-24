import React from "react";
import { Route, Switch } from "react-router-dom";

import Users from './components/users' ;
import {FoodCourtRestaurantList} from "./components/FoodCourtListItem";
import {MenuGridList} from "./components/FoodCourtRestaurantItem";
import OrderSummary from "./components/OrderPage";
import {OrderResponse} from "./components/OrderPage";
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
      <Route exact path='/foodcourts/:restaurant_name/menu' name="food_court_restaurants" component={MenuGridList} />
      <Route exact path='/foodcourts/:restaurant_name/order/' name="food_court_restaurants_order" component={OrderSummary} />
      <Route exact path='/foodcourts/order/response' name="food_court_restaurants_response" component={OrderResponse} />

  </Switch>
);

export default BaseRouter;
