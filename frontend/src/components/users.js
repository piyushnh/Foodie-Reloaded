import React from 'react';
import UserList from './userlist';
import List from '@material-ui/core/List';
import { withStyles } from '@material-ui/core/styles';

import axios from "axios";
import { connect } from "react-redux";



const styles = theme => ({
  root: {
    width: '100%',
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  },
  inline: {
    display: 'inline',
  },
});


class Users extends React.Component {

    constructor(props) {
    super(props);
    this.state = {
      users: []
    };
  }


  componentWillMount() {


    var token = localStorage.getItem('token')

    console.log("Token is" + token);
    axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${token}`
    }

    axios
      .get("http://localhost:8000/friendship/users/")
      .then(res => this.setState({ users: res.data }) )
      .catch(err => console.log(err));
  }




  render(){
    return(
      <div>
        <List className={this.props.classes.root}>
          <UserList data={this.state.users}/>
        </List>
      </div>


    )
  }

}

const mapStateToProps = state => {
  return {
    token: state.token
  };
};


export default connect(mapStateToProps)(withStyles(styles)(Users));
