import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import red from '@material-ui/core/colors/red';
import { connect } from "react-redux";
import Button from '@material-ui/core/Button';
import axios from "axios";
import TextField from '@material-ui/core/TextField';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import clsx from 'clsx';

import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import CardActions from '@material-ui/core/CardActions';
import Collapse from '@material-ui/core/Collapse';
import Avatar from '@material-ui/core/Avatar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import ShareIcon from '@material-ui/icons/Share';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import MoreVertIcon from '@material-ui/icons/MoreVert';
import LinearProgress from '@material-ui/core/LinearProgress';


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


class Order extends React.Component {

  constructor(props) {
  super(props);
  this.state = {
    isOrderAccepted: this.props.orderData.is_accepted,
    isExpanded: false,
    isSocketOpen: false,
  }

  this.socket = null;
  this.onOrderAccept = this.onOrderAccept.bind(this);
  this.onOrderReady = this.onOrderReady.bind(this);
  this.waitForSocketConnection = this.waitForSocketConnection.bind(this);
  this.handleExpandClick = this.handleExpandClick.bind(this);
  
 }

  componentWillMount()
  {
    let order_id = this.props.orderData.order_id;
    this.socket = new W3CWebSocket(`ws://127.0.0.1:8000/ws/order/${order_id}/`);


    this.socket.onopen = () => {
        this.setState({isSocketOpen: true});
       
      };
    
     this.socket.onmessage = (res) => {
        let newOrder = JSON.parse(res.data);
        console.log(newOrder);
       
      };



  }

waitForSocketConnection(callback) {
    setTimeout(
        function () {
            if (this.state.isSocketOpen) {
                alert('Open!')
                if (callback != null){
                    callback();
                }
            } else {
                this.waitForSocketConnection(callback);
            }

        }.bind(this), 5); // wait 5 milisecond for the connection...
}

  async onOrderAccept() {
      function sendAcceptMsg() {
        const payload = JSON.stringify({
            message: {
                type: 'order_accepted'
            }   
             })
        this.socket.send(payload);
      }

      await this.waitForSocketConnection(sendAcceptMsg.bind(this));
      this.setState({isOrderAccepted: true});
      
      
  }
 async onOrderReady() {
    function sendReadyMsg() {
        const payload = JSON.stringify({
            message: {
                type: 'order_ready'
            }   
             })
        this.socket.send(payload);
      }

      await this.waitForSocketConnection(sendReadyMsg.bind(this));
  }

  handleExpandClick() {
    this.setState((prevstate) => ({
        isExpanded: !prevstate.isExpanded
    }))
  }

  render()
  {
    const { classes } = this.props;
    const order = this.props.orderData;




  
    return(

      
      
        <Card className={classes.card}>
      <CardHeader
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar}>
            R
          </Avatar>
        }
        action={
          <IconButton aria-label="settings">
            <MoreVertIcon />
          </IconButton>
        }
        title={order.id}
        subheader="September 14, 2016"
      />
      <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">
            Cooking instructions will appear here
        </Typography>
      </CardContent>
      <CardActions disableSpacing>
      {
        this.state.isOrderAccepted ?
        
        <Button variant="contained" color="primary" onClick={this.onOrderReady}>
        Order Ready?
        <LinearProgress color="secondary" variant="query" />
       </Button>
        
        :
      <Button variant="contained" color="primary" onClick={this.onOrderAccept}>
        Accept order
        <LinearProgress color="secondary" variant="query" />
      </Button>

      }
      
        <IconButton aria-label="share">
          <ShareIcon />
        </IconButton>
        <IconButton
          className={clsx(classes.expand, {
            [classes.expandOpen]: this.state.isExpanded,
          })}
          onClick={this.handleExpandClick}
          aria-expanded={this.state.isExpanded}
          aria-label="show more"
        >
          <ExpandMoreIcon />
        </IconButton>
      </CardActions>
      <Collapse in={this.state.isExpanded} timeout="auto" unmountOnExit>
        <CardContent>
          <Typography paragraph>Method:</Typography>
          <Typography paragraph>
            Heat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10
            minutes.
          </Typography>
          <Typography paragraph>
            Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high
            heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly
            browned, 6 to 8 minutes. Transfer shrimp to a large plate and set aside, leaving chicken
            and chorizo in the pan. Add pimentón, bay leaves, garlic, tomatoes, onion, salt and
            pepper, and cook, stirring often until thickened and fragrant, about 10 minutes. Add
            saffron broth and remaining 4 1/2 cups chicken broth; bring to a boil.
          </Typography>
          <Typography paragraph>
            Add rice and stir very gently to distribute. Top with artichokes and peppers, and cook
            without stirring, until most of the liquid is absorbed, 15 to 18 minutes. Reduce heat to
            medium-low, add reserved shrimp and mussels, tucking them down into the rice, and cook
            again without stirring, until mussels have opened and rice is just tender, 5 to 7
            minutes more. (Discard any mussels that don’t open.)
          </Typography>
          <Typography>
            Set aside off of the heat to let rest for 10 minutes, and then serve.
          </Typography>
        </CardContent>
      </Collapse>
    </Card>
      
    )
  
  }
}
const mapStateToProps = state => {
  return {
    token: state.authReducer.token,
    restaurant: state.orderPageReducer.cart.restaurant
  };
};

export default connect(mapStateToProps)(withStyles(styles)(Order));
