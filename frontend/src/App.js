import React, { Component } from "react";
import Navbar from "./components/Navigation/Navbar";
import BottomNavbar from "./components/Navigation/BottomNavbar";
import { BrowserRouter as Router } from "react-router-dom";
import { withStyles } from "@material-ui/core/styles";

import CartIcon from './components/Orders/CartIcon';


// redux imports
import { connect } from 'react-redux';
import * as actions from './store/actions/auth/action';
import LoginDialog from './components/Authentication/LoginOptions'

import BaseRouter from "./routes";
import { Typography } from "antd";
// import BottomScrollListener from "react-bottom-scroll-listener";
import GenericError from './components/ErrorHandlers/GenericError';

const styles = theme => ({
	root: {
		// display: 'flex',
		// flexWrap: 'wrap',
	}
});

class App extends Component {
	constructor(props) {
		super(props);
		this.state = {
			openLoginDialog: true
		};

		this.handleLoginDialogClose = this.handleLoginDialogClose.bind(this);
	}

	handleLoginDialogClose() {
		console.log("Closed");
		this.setState({ openLoginDialog: false });
	}

	componentDidMount() {
		// this.props.onTryAutoSignup();
	}

  render() {
    const {classes} = this.props;
    return (
      <Router>
        <div className={classes.root}>
            <Navbar {...this.props}/>
              <GenericError>
                <BaseRouter />
              </GenericError>
              {
                this.props.cart.display 
                ? <CartIcon /> 
                : null
    
              }


					{this.props.isAuthenticated ? (
						/* (
						<BottomScrollListener />
          )  */
						<Typography />
					) : (
						<LoginDialog
							open={this.state.openLoginDialog}
							handleClose={this.handleLoginDialogClose}
						/>
					)}
				</div>
			</Router>
		);
	}
}

const mapStateToProps = state => {
  return {
    isAuthenticated: state.authReducer.token !== null,
    cart: state.orderPageReducer.cart
  }
}

// const mapDispatchToProps = dispatch => {
//   return {
//     onTryAutoSignup: () => dispatch(actions.authCheckState())
//   }
// }

export default connect(
	mapStateToProps,
	null
)(withStyles(styles)(App));
