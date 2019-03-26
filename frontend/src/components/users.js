import React from 'react';
import UserList from './userlist';
import List from '@material-ui/core/List';
import { withStyles } from '@material-ui/core/styles';



import axios from "axios";

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

  componentDidMount() {
  this.refreshList();
  }

  refreshList = () => {
    axios
      .get("http://localhost:8000/friendship/users/")
      .then(res => this.setState({ users: res.data }) )
      .catch(err => console.log(err));
  };

// this.setState({ users: res.data })

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

export default withStyles(styles)(Users);
