import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import red from '@material-ui/core/colors/red';
import Restaurant from './Restaurant' ;
import { connect } from "react-redux";

import axios from "axios";



const styles = theme => ({
  card: {
    maxWidth: 400,
  },
  media: {
    height: 0,
    paddingTop: '56.25%', // 16:9
  },
  actions: {
    display: 'flex',
  },
  expand: {
    transform: 'rotate(0deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: 'rotate(180deg)',
  },
  avatar: {
    backgroundColor: red[500],
  },
});


class RestaurantList extends React.Component {

  constructor(props) {
  super(props);
  this.state = {
    restaurants: []
  };
 }

  componentWillMount()
  {
    const {foodcourtID} = this.props.location.state
    axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${this.props.token}`
    }

    axios
      .get(`http://127.0.0.1:8000/restaurants/foodcourt/members/${foodcourtID}`)
      .then(res => this.setState({ restaurants: res.data }) )
      .catch(err => console.log(err));
  }

  render()
  {
    const restaurants = this.state.restaurants;
    const { classes } = this.props;

    return(
      restaurants.map((restaurant)=>
      <>
        <br />
         <Restaurant key={restaurant.id} data={restaurant} />
        <br />
      </>
    )
  )
  }
}
const mapStateToProps = state => {
  return {
    token: state.authReducer.token
  };
};

export default connect(mapStateToProps)(withStyles(styles)(RestaurantList));
