import React, { Component } from "react";
import Navbar from "./components/Navigation/Navbar";
import BottomNavbar from "./components/Navigation/BottomNavbar";
import { BrowserRouter as Router } from "react-router-dom";
import { withStyles } from "@material-ui/core/styles";

// redux importss
import { connect } from "react-redux";
import * as actions from "./store/actions/auth/action";
import LoginDialog from "./components/Authentication/LoginOptions";

import BaseRouter from "./routes";
import { Typography } from "antd";
// import BottomScrollListener from "react-bottom-scroll-listener";

const styles = theme => ({
	root: {
		// display: 'flex',
		// flexWrap: 'wrap',
	}
});

class App extends Component {
<<<<<<< 0971fb46f9b7b4c9fd7506f1e6e2b35c26102b36

  constructor(props) {
    super(props);
    this.state = {
        openLoginDialog: true
    };

    this.handleLoginDialogClose = this.handleLoginDialogClose.bind(this);
   }
  
  handleLoginDialogClose()
  {
    console.log('Closed');
    this.setState({openLoginDialog: false});
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

            {this.props.isAuthenticated 
              ? <BottomNavbar/>
            
            : <LoginDialog open={this.state.openLoginDialog} handleClose={this.handleLoginDialogClose} />}
        </div>
     </Router>

    );
  }
=======
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
		const { classes } = this.props;
		return (
			<Router>
				<div className={classes.root}>
					<Navbar {...this.props} />

					<BaseRouter />

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
>>>>>>> added
}

const mapStateToProps = state => {
	return {
		isAuthenticated: state.authReducer.token !== null
	};
};

// const mapDispatchToProps = dispatch => {
//   return {
//     onTryAutoSignup: () => dispatch(actions.authCheckState())
//   }
// }

export default connect(
	mapStateToProps,
	null
)(withStyles(styles)(App));
