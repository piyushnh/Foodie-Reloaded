import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import { withRouter } from 'react-router-dom';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import Icon from '@material-ui/core/Icon';
import Button from '@material-ui/core/Button';
import { connect } from "react-redux";




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
  this.handlePaymentRetry = this.handlePaymentRetry.bind(this);
  this.state = {
    responseData:{},
  };
  }


  handlePaymentRetry()
  {

    let data = JSON.parse(localStorage.getItem('orderData'));
    let restaurantName = data["restaurant"]["name"];
    console.log(restaurantName);
    this.props.history.push({
      pathname:'/foodcourts/'+restaurantName+'/order/',
      state:{order:data}
    });


    // this.props.history.goBack()
    // this.props.history.go(-3);
  }

  componentDidMount()
  {
      axios.defaults.headers.common = {
      "Content-Type": "application/json",
      Authorization: `Token ${this.props.token}`
      }

      axios
        .get(`http://127.0.0.1:8000/paytm/order_response/`)
        .then(res => {

             if (res.status === 200) {
               console.log(res.data);
               this.setState({responseData: res.data});
             }
           })
        .catch(err => console.log(err));
  }





  render() {
    const { classes } = this.props;
    const data = this.state.responseData;
    let display;
    // const {data} = this.props.location.state

    if (data['STATUS'] === "TXN_SUCCESS")
    {
       display = (<>
              <Icon className = {classes.icon} color="primary">mood</Icon>
                  <Typography variant="h5" component="h3">
                      Transaction Successful
                  </Typography>


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
              Paytm's Response Message : {data['RESPMSG']}
          </Typography>

          <Button variant="contained" color="primary" className={classes.button} onClick = {this.handlePaymentRetry}>
            Retry payment
          </Button>
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
    token: state.authReducer.token
  };
};

export default connect(mapStateToProps)(withStyles(styles)(OrderResponse));



