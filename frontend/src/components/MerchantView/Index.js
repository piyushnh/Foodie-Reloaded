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


var W3CWebSocket = require('websocket').w3cwebsocket;


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


class Index extends React.Component {

  constructor(props) {
  super(props);
  this.state = {
    orderList: []
  };

  this.socket = null;
  this.handleChange = this.handleChange.bind(this);
  this.onSend = this.onSend.bind(this);
 }

  componentWillMount()
  {
    let restaurant_id = this.props.restaurant.id;
    this.socket = new W3CWebSocket(`ws://127.0.0.1:8000/ws/orders/${restaurant_id}/`);


    this.socket.onopen = () => {
        console.log('WebSocket Client Connected');
      };
     this.socket.onmessage = (res) => {
        let newOrder = JSON.parse(JSON.parse(res.data));
        console.log(newOrder);
        this.setState({orderList:[...this.state.orderList,newOrder.order]});
      };
  }

  handleChange = event => {
    this.setState({ sendMessage: event.target.value });
  };

  onSend() {
      let payload = JSON.stringify({
          message: this.state.sendMessage
      })
      
      this.socket.send(payload);
  }

  render()
  {
    const { classes } = this.props;
  
    return(

      <List >
      {this.state.orderList.map((order)=>
      
      <ListItem key={order.order_id}>
        <ListItemText
        primary={order.order_id}
        />
        <p>{order.amount}</p>
     </ListItem>
      )
      }
      </List>
    )
  
  }
}
const mapStateToProps = state => {
  return {
    token: state.authReducer.token,
    restaurant: state.orderPageReducer.cart.restaurant
  };
};

export default connect(mapStateToProps)(withStyles(styles)(Index));
