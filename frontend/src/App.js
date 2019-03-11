import React, { Component } from 'react';
import './App.css';
import Navbar from './containers/Navbar';
import { Route, Switch  } from 'react-router-dom'
import Users from './components/users' ;
import Contact from './components/contact' ;

class App extends Component {
  render() {
    return (
      <div className="App">

        <Navbar />
        <Switch>
            <Route path="/users/" component={Users} />
            <Route path="/contact/" component={Contact} />
        </Switch>
      </div>
    );
  }
}

export default App;
