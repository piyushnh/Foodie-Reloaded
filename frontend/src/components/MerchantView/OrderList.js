import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import red from '@material-ui/core/colors/red';
import { connect } from "react-redux";
import Button from '@material-ui/core/Button';
import axios from "axios";
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';



import Order from './OrderComponent';


var W3CWebSocket = require('websocket').w3cwebsocket;


const styles = theme => ({
  card: {
    minWidth: 275,
  },
  bullet: {
    display: 'inline-block',
    margin: '0 2px',
    transform: 'scale(0.8)',
  },
  title: {
    fontSize: 14,
  },
  pos: {
    marginBottom: 12,
  },
});


class Orders extends React.Component {

  constructor(props) {
  super(props);
  this.state = {
    orderList: [],
    restaurant: null
  };

  this.socket = null;
 }

 componentWillMount()
 {
   const owner_id = this.props.user_id;
  axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${this.props.token}`
    }

    axios
      .get(`http://127.0.0.1:8000/restaurant_merchants/restaurant_owned/${owner_id}`)
      .then(res => 
        {
          this.setState({ restaurant: res.data });

          const restaurant_id = res.data.id;
      this.socket = new W3CWebSocket(`ws://127.0.0.1:8000/ws/orderList/${restaurant_id}/`);
  
  
      this.socket.onopen = () => {
          console.log('WebSocket Client Connected');
        };
       this.socket.onmessage = (res) => {
          let newOrder = JSON.parse(res.data);
          console.log(newOrder);
          this.setState({orderList:[...this.state.orderList,newOrder.order]});
        };
  
      axios.defaults.headers.common = {
      "Content-Type": "application/json",
      Authorization: `Token ${this.props.token}`
      }
  
      axios
        .get(`http://127.0.0.1:8000/restaurant_merchants/processing_orders/${restaurant_id}`)
        .then(res => this.setState({ orderList: res.data }) )
        .catch(err => console.log(err));
        } )
      .catch(err => console.log(err));


  }
 



  

  // onSend() {
  //     let payload = JSON.stringify({
  //         message: this.state.sendMessage
  //     })
      
  //     this.socket.send(payload);
  // }

  render()
  {
    const { classes } = this.props;




  
    return(

      <List >
      {this.state.orderList.map((order)=>
      
        <Order orderData={order} />
      )
      }
      </List>
    )
  
  }
}
const mapStateToProps = state => {
  return {
    token: state.authReducer.token,
    user_id: state.authReducer.user.id, 
    restaurant: state.orderPageReducer.cart.restaurant
  };
};

export default connect(mapStateToProps)(withStyles(styles)(Orders));
