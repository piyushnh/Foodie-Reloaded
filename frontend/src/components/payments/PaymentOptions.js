import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Checkbox from '@material-ui/core/Checkbox';
import Popper from '@material-ui/core/Popper';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import Fade from '@material-ui/core/Fade';
import { connect } from 'react-redux';
import TextField from '@material-ui/core/TextField';
import axios from "axios";
import Paytm from './Paytm';
import * as actions from '../../store/actions/order/action';



const styles = theme => ({
    typography: {
        padding: theme.spacing(2),
      },
      formInput:
      {
        display:'none',
      },
});


class PaymentOptions extends React.Component {

  constructor(props) {
  super(props);
  // this.fetchPaymentOptions = this.fetchPaymentOptions.bind(this);
   this.state = {

   };
  }

componentWillMount()
{
    const cart = this.props.cart;
    axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${this.props.token}`
    }

    //If payment fails, current order is deleted and new one is created
    try {
        if (this.props.location.isRetryPayment)
        { 
            let orderId = this.props.orderData.order_id;
            axios
            .delete(`http://127.0.0.1:8000/restaurants/order_details/${orderId}`)
            .then(res => {
                    console.log(res);
                })
            .catch(err => console.log(err));
        }
      }
      catch(err) {
        console.log(err);
      } 
      finally {
        
        
        axios
            .post(`http://127.0.0.1:8000/restaurants/order/create/`, cart)
            .then(res => {
        
                if (res.status === 201) {
                    this.props.setOrderData(res.data);
                }
                })
            .catch(err => console.log(err));
      }
    
    

}
  

  render() {
    const {classes} = this.props;
    return (
        <div className = "container">
            <Paytm />
        </div>
    );
  }
}

PaymentOptions.propTypes = {
  classes: PropTypes.object.isRequired,
};

const mapStateToProps = (state) => {
  return {
     token: state.authReducer.token,
     orderData: state.orderPageReducer.orderData,
     cart: state.orderPageReducer.cart,

    }
}

  const mapDispatchToProps = dispatch => {
  return {
      setOrderData: (orderData) => dispatch(actions.setOrderData(orderData))
  }
}

export default connect(mapStateToProps,mapDispatchToProps)(withStyles(styles)(PaymentOptions));
