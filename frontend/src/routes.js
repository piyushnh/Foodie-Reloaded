import React from "react";
import { Route, Switch } from "react-router-dom";

import Users from './components/users' ;
import RestaurantList from "./components/Restaurant/RestaurantList";
import MenuGridList from "./components/Menu/Menu";
import Cart from "./components/Orders/Cart";
import PaymentOptions from "./components/payments/PaymentOptions";
import OrderResponse from "./components/Orders/OrderResponse";
import FoodCourtList from "./components/FoodCourt/FoodCourtList";
import Login from "./containers/Login";
import Signup from "./containers/Signup";

const BaseRouter = () => (
  <Switch>
      <Route exact path="/users/" component={Users} />
      <Route exact path="/nearbyfoodcourts/" component={FoodCourtList} />
      <Route exact path="/login" component={Login} />
      <Route exact path="/signup" component={Signup} />
      <Route exact path='/nearbyfoodcourts/:food_name' name="food_court_restaurants" component={RestaurantList} />
      <Route exact path='/foodcourts/:restaurant_name/menu' name="food_court_restaurants" component={MenuGridList} />
      <Route exact path='/foodcourts/:restaurant_name/order/' name="food_court_restaurants_order" component={Cart} />
      <Route exact path='/foodcourts/restaurants/payment' name="food_court_restaurants_payment" component={PaymentOptions} />
      <Route exact path='/foodcourts/order/response' name="food_court_restaurants_response" component={OrderResponse} />

  </Switch>
);

export default BaseRouter;
