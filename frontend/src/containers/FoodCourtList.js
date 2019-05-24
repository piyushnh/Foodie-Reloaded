import React from 'react';
import FoodCourtListCard from '../components/FoodCourtListItem';
import { withStyles } from '@material-ui/core/styles';
import { connect } from "react-redux";

import { Spin, Icon } from 'antd';
import axios from "axios";

const antIcon = <Icon type="loading" style={{ fontSize: 50, margin:'200%' }} spin />;



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


class FoodCourtList extends React.Component {

    constructor(props) {
    super(props);
    this.state = {
      restaurants: [],
      isLoading : true
    };
  }




  componentWillMount()
  {
    var token = localStorage.getItem('token')

    axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${token}`
    }

    axios
      .get("http://localhost:8000/restaurant/nearbyfoodcourts/")
      .then(res => this.setState({ restaurants: res.data }) )
      .catch(err => console.log(err));
  }

  componentDidMount()
  {
    this.setState({isLoading: false})
  }

// this.setState({ users: res.data })


  render(){

    var isLoading = this.state.isLoading

    const restaurants = this.state.restaurants
    return(
      <div>
      {
        isLoading

        ?

        <Spin indicator={antIcon} />

        :

        restaurants.map((restaurant)=>
        <>
        <br />
        <FoodCourtListCard key={restaurant.id} data={restaurant} />
        <br />
        </>
        )


      }
    </div>


  )
  }

}

const mapStateToProps = state => {
  return {
    token: state.token
  };
};

export default connect(mapStateToProps)(withStyles(styles)(FoodCourtList));
