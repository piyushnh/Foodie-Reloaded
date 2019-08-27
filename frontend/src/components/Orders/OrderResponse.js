import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import { withRouter } from 'react-router-dom';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import Icon from '@material-ui/core/Icon';
import Button from '@material-ui/core/Button';
import LoadingSpinner from '../Utility/LoadingSpinner';
import { connect } from "react-redux";
import {Link} from 'react-router-dom';
import * as actions from '../../store/actions/order/action';




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

class OrderResponse extends React.Component {

  constructor(props) {
  super(props);
  this.timer = null;
  this.state = {
    responseData: null
  }
  }


  componentWillMount()
  {
      const order_id = this.props.orderData.order_id;
      axios.defaults.headers.common = {
      "Content-Type": "application/json",
      Authorization: `Token ${this.props.token}`
      }

      axios
        .get(`http://127.0.0.1:8000/paytm/order_response/${order_id}`)
        .then(res => {
             if (res.status === 200) {
                this.setState({responseData: res.data});
             }
           })
        .catch(err => console.log(err));
  }


  handleSuccess() {
    this.timer = setTimeout(() => 
    this.redirect()
    , 5000)
  }
  
  componentWillUnmount() {
    if (!this.timer)
      clearTimeout(this.timer);
  }

 redirect()
 {
  this.props.setOrderData(null);
  this.props.resetCart();
  this.props.history.push('/');
 }



  render() {
    const { classes } = this.props;
    const data = this.state.responseData;
    console.log(data)
    console.log(data);
    let display;
    if (!data)
      display = <LoadingSpinner />
    else if (data['STATUS'] === "TXN_SUCCESS")
    {
      this.handleSuccess();

       display = (<>
              <Icon className = {classes.icon} color="primary">mood</Icon>
                  <Typography variant="h5" component="h3">
                      Transaction Successful
                  </Typography>
                  <Link to="/" >
                    <Button variant="contained" color="primary" onClick={this.handleClick} className={classes.button} >
                      Go to Home
                    </Button>
                  </Link>

                  </>
   );
    }
    else {
      display = (
        <>
        <Icon className = {classes.icon}>mood_bad</Icon>
          <Typography variant="h5" component="h3">
            Transaction Failed
          </Typography>

          <Typography className = {classes.respMessage}>
              Response Message : {data['RESPMSG']}
          </Typography>
          
         <Link to={{ pathname: '/foodcourts/restaurants/payment', isRetryPayment: true }} >
            <Button variant="contained" color="primary" onClick={this.handleClick} className={classes.button} >
              Retry payment
            </Button>
          </Link>
        </>
    );
    }



    return (
      <Paper className={classes.root}>

       {display}

     </Paper>
    )

 }
}

OrderResponse.propTypes = {
  classes: PropTypes.object.isRequired,
};

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
export default connect(mapStateToProps,mapDispatchToProps)(withStyles(styles)(OrderResponse));



