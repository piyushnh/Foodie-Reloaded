import React from "react";
import { Route, Switch } from "react-router-dom";
import RouteWithLayout from "./components/RouteWithLayout";
import Users from "./components/users";
import RestaurantList from "./components/Restaurant/RestaurantList";
import MenuGridList from "./components/Menu/Menu";
import Cart from "./components/Orders/Cart";
import PaymentOptions from "./components/payments/PaymentOptions";
import OrderResponse from "./components/Orders/OrderResponse";
import MerchantLogin from "./components/MerchantView/Login";
import MerchantOrders from "./components/MerchantView/OrderList";
import FoodCourtList from "./components/FoodCourt/FoodCourtList";
import OrderList from "./components/OrderList/OrderList";
import Login from "./containers/Login";
import Signup from "./containers/Signup";
import OrderStatus from "./components/Orders/OrderStatus";


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
				path="/orders/"
				component={OrderList}
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
			<RouteWithLayout
				exact
				path="/nearbyfoodcourts/:food_name"
				component={RestaurantList}
				layout={MainLayout}
			/>
			<RouteWithLayout
				exact
				path="/foodcourts/:restaurant_name/menu"
				component={MenuGridList}
				layout={MainLayout}
			/>
			<RouteWithLayout
				exact
				path="/foodcourts/:restaurant_name/order/"
				component={Cart}
				layout={MainLayout}
			/>
			<RouteWithLayout
				exact
				path="/foodcourts/restaurants/payment"
				component={PaymentOptions}
				layout={MainLayout}
			/>
			<RouteWithLayout
				exact
				path="/foodcourts/order/response"
				component={OrderResponse}
				layout={MainLayout}
      />
      <RouteWithLayout
       exact
       path="/merchant/login" 
       component={MerchantLogin} 
       layout={MainLayout}/>

      <RouteWithLayout
       exact
       path="/ordersList" 
       component={MerchantOrders} 
       layout={MainLayout}/>

      <RouteWithLayout
       exact
       path="/order/status" 
       component={OrderStatus} 
       layout={MainLayout}/>
       <Route exact path='/order/status' name="order_status" component={OrderStatus} />

		</ThemeProvider>
	</Switch>
);

export default BaseRouter;
