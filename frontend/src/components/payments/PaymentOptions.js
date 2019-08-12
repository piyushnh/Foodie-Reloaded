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
  this.handlePaytmChange = this.handlePaytmChange.bind(this);
  this.initiatePayment = this.initiatePayment.bind(this);
  // this.fetchPaymentOptions = this.fetchPaymentOptions.bind(this);
   this.state = {
       paytm:{
        checked: null,
        phoneNumber: null,
        clickedAlready: false,

       },
       paytm_data: {}

   };
  }


  // fetchPaymentOptions(txnToken)
  // { 
    // IN CASE WE WANNA DO CUSTOM CHECKOUT
  //   debugger;
  //   const order_id = this.props.orderData.order_id;
  //   const merchant_id = this.props.orderData.restaurant.paytm_merchant; 
  //   const payload = {
  //     head: {
  //       txnToken: txnToken,
  //       channelId: 'WAP'
  //     }
  //   }
  //   axios.defaults.headers.common = {
  //     "Content-Type": "application/json",
  //     }

  //     axios
  //     .post(`https://securegw-stage.paytm.in/fetchPaymentOptions?mid=${merchant_id}&orderId=${order_id}`, payload)
  //     .then(res => {

           
  //            console.log(res.data)
  //           //  this.initiatePayment(res.data);
  //        })
  //     .catch(err => console.log(err));
    
  // }

  initiatePayment()
  {
      axios.defaults.headers.common = {
      "Content-Type": "application/json",
      Authorization: `Token ${this.props.token}`
      }
  
      axios
        .post(`http://127.0.0.1:8000/paytm/initiate_payment/`, this.props.orderData)
        .then(res => {
  
             if (res.status === 200) {
                this.setState({paytm_data: res.data});
              }
           })
        .catch(err => console.log(err));
  }

  handlePaytmChange = () => event => {
    // if (!this.state.paytm.clickedAlready)
    // {
      this.initiatePayment();
    // }
    if (this.state.paytm.checked)
      this.setState({paytm:{checked: null }});
    else
      this.setState({paytm:{checked: event.currentTarget }});

  };


  


  render() {
    const {classes} = this.props;
    const paytm_data = this.state.paytm_data;
    return (
        <div className = "container">
        <Checkbox
        checked={this.state.paytm.checked}
        onChange={this.handlePaytmChange()}
        value="checkedPaytm"
        id="payTM"
        label = "payTM"
      />
        <Popper id="payTM"  open={this.state.paytm.checked} anchorEl={this.state.paytm.checked} transition>
          {({ TransitionProps }) => (
            <Fade {...TransitionProps}>
            <form action=" https://securegw-stage.paytm.in/order/process">
        {

          Object.keys(paytm_data).map(key =>(
            <input  name={key}  value={paytm_data[key]} className={classes.formInput}/>
          )

          )
        }

        <input type="submit" value="Submit" />
      </form>
            </Fade>
          )}
        </Popper>
      </div>
    );
  }
}

PaymentOptions.propTypes = {
  classes: PropTypes.object.isRequired,
};

const mapStateToProps = (state) => {
  return {
     orderData: state.orderPageReducer.orderData,
     token: state.authReducer.token
    }
}

//   const mapDispatchToProps = dispatch => {
//   return {
//       setOrderData: (orderData) => dispatch(actions.setOrderData(orderData))
//   }
// }

export default connect(mapStateToProps,null)(withStyles(styles)(PaymentOptions));
