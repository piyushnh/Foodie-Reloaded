import React from "react";
import { Route, Switch } from "react-router-dom";
import RouteWithLayout from "./components/RouteWithLayout";
import Users from "./components/users";
import RestaurantList from "./components/Restaurant/RestaurantList";
import MenuGridList from "./components/Menu/Menu";
import Cart from "./components/Orders/Cart";
import PaymentOptions from "./components/payments/PaymentOptions";
import OrderResponse from "./components/Orders/OrderResponse";
import FoodCourtList from "./components/FoodCourt/FoodCourtList";
import Login from "./containers/Login";
import Signup from "./containers/Signup";
import { Main as MainLayout, Minimal as MinimalLayout } from "./layouts";

import { ThemeProvider } from "@material-ui/styles";
import theme from "./theme";

const BaseRouter = () => (
	<Switch>
		<Route exact path="/users/" component={Users} />
		<ThemeProvider theme={theme}>
			<RouteWithLayout
				exact
				path="/nearbyfoodcourts/"
				component={FoodCourtList}
				layout={MainLayout}
			/>
			<RouteWithLayout
				exact
				path="/login"
				component={Login}
				layout={MainLayout}
			/>
			<RouteWithLayout
				exact
				path="/signup"
				component={Signup}
				layout={MainLayout}
			/>
		</ThemeProvider>
		<Route
			exact
			path="/nearbyfoodcourts/:food_name"
			name="food_court_restaurants"
			component={RestaurantList}
		/>
		<Route
			exact
			path="/foodcourts/:restaurant_name/menu"
			name="food_court_restaurants"
			component={MenuGridList}
		/>
		<Route
			exact
			path="/foodcourts/:restaurant_name/order/"
			name="food_court_restaurants_order"
			component={Cart}
		/>
		<Route
			exact
			path="/foodcourts/restaurants/payment"
			name="food_court_restaurants_payment"
			component={PaymentOptions}
		/>
		<Route
			exact
			path="/foodcourts/order/response"
			name="food_court_restaurants_response"
			component={OrderResponse}
		/>
	</Switch>
);

export default BaseRouter;
