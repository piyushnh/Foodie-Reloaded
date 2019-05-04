import React, { Component } from 'react';
import Navbar from './containers/Navbar';
import { BrowserRouter as Router } from 'react-router-dom';

// redux imports
import { connect } from 'react-redux';
import * as actions from './store/actions/auth';

import BaseRouter from './routes';


class App extends Component {

  componentDidMount() {
    this.props.onTryAutoSignup();
  }

  render() {
    return (
      <Router>
        <div>
            <Navbar {...this.props}/>

              <div className="container">
                <BaseRouter />
              </div>

        </div>
     </Router>

    );
  }
}

const mapStateToProps = state => {
  return {
    isAuthenticated: state.token !== null
  }
}

const mapDispatchToProps = dispatch => {
  return {
    onTryAutoSignup: () => dispatch(actions.authCheckState())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
