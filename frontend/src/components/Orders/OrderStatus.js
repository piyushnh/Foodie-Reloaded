import { withStyles } from '@material-ui/core/styles';
import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import ListItemText from '@material-ui/core/ListItemText';
import { connect } from "react-redux";
import {Link} from 'react-router-dom';
import FolderIcon from '@material-ui/icons/Folder';
import * as actions from '../../store/actions/order/action';

import Stepper from '../Utility/Stepper';




import axios from "axios";  

const styles = theme => ({
  root: {
    flexGrow: 1,
    textAlign : 'center',
    marginTop: '10%'
  },
//   paper: {
//     height: 140,
//     width: 100,
//   },
  control: {
    padding: theme.spacing(2),
  },

  paper:
  {
    marginTop: '20%',
    width: '100%',
    padding:'5%',
    height: 140,
  },
  icon:
  {
    fontSize: '10em',
  },
  respMessage:
  {
    fontSize: '1em',
    color: 'red'
  },
  button:
  {
    marginTop: '20%',
    marginBottom: '10%',
  },
  fab:
  {
    marginTop: '20%',
  }
});

class OrderStatus extends React.Component {

  constructor(props) {
  super(props);
  this.timer = null;
  this.getSteps = this.getSteps.bind(this);
  this.getStepContent = this.getStepContent.bind(this);
  this.state = {
    step: 0
  }
  }

 getSteps() {
    return ['Order Placed', 'Order Accepted', 'Order Ready!'];
  }
  
  getStepContent(step) {
    switch (step) {
      case 0:
        return `Waiting for the restaurant to confirm your order`;
      case 1:
        return 'Please wait while your order is being prepared';
      case 2:
        return `Your order is ready! Please pick it up from the restaurant`;
      default:
        return 'Unknown step';
    }
  }
  
  nextStep() {
    this.setState((prevState) => ({
      step: prevState.step + 1
    }))
  }


  

  render() {
    const { classes } = this.props;
    const orderData = this.props.orderData;
    
      
        
    return (
      <>
        <List >
        {orderData.items.map((item) => 
          <ListItem>
            <ListItemIcon>
              <FolderIcon />
            </ListItemIcon>
            <ListItemText
              primary={item.name}
              secondary={null}
            />
          </ListItem>,
        )}
      </List>

      <Stepper  getSteps = {this.getSteps} getStepContent = {this.getStepContent}/>
      </>
    
          )
    }



    

 }




const mapStateToProps = state => {
  return {
    token: state.authReducer.token,
    orderData: state.orderPageReducer.orderData
  };
};

const mapDispatchToProps = dispatch => {
  return {
      setOrderData: (orderData) => dispatch(actions.setOrderData(orderData)),
      resetCart: () => dispatch(actions.resetCart())
  }
}
export default connect(mapStateToProps,mapDispatchToProps)(withStyles(styles)(OrderStatus));



