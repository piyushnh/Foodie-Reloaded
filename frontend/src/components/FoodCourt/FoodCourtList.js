import React from 'react';
import FoodCourtCard from './FoodCourt';
import { withStyles } from '@material-ui/core/styles';
import { connect } from "react-redux";
import Container from '@material-ui/core/Container';
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
      foodCourts: [],
      isLoading : true
    };
  }




  componentWillMount()
  {

    axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${this.props.token}`
    }

    axios
      .get("http://localhost:8000/restaurants/nearbyfoodcourts/")
      .then(res => this.setState({ foodCourts: res.data }) )
      .catch(err => console.log(err));
  }

  componentDidMount()
  {
    this.setState({isLoading: false})
  }

// this.setState({ users: res.data })


  render(){

    var isLoading = this.state.isLoading

    const foodCourts = this.state.foodCourts
    return(
      <Container>
      {
        isLoading

        ?

        <Spin indicator={antIcon} />

        :

        foodCourts.map((foodCourt)=>
        <>
        <br />
         <FoodCourtCard key={foodCourt.id} data={foodCourt} />
        <br />
        </>
        )
      }
      </Container>
      
  )
  }

}

const mapStateToProps = state => {
  return {
    token: state.authReducer.token
  };
};

export default connect(mapStateToProps)(withStyles(styles)(FoodCourtList));
