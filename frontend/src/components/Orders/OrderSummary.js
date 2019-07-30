import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import ListSubheader from '@material-ui/core/ListSubheader';
import { withRouter } from 'react-router-dom';
import Divider from '@material-ui/core/Divider';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import Fab from '@material-ui/core/Fab';
import axios from "axios";



const styles = theme => ({
  root: {
    flexGrow: 1,
  },
  // paper: {
  //   height: 140,
  //   width: 100,
  // },
  control: {
    padding: theme.spacing(2),
  },
  divider:
  {
    marginLeft:'5%',
    marginRight:'5%',
  },
  paper:
  {
    marginTop: '20%',
    width: '100%',
    padding:'5%',
    height: 140,
    width: 100,
  },
  formInput:
  {
    display:'none',
  },
  fab:
  {
    marginTop: '20%',
  },
  submit:
  {
    marginTop: '40%',
    width:'8em',
    height:'5em',
  },
});


class OrderSummary extends React.Component {

  constructor(props) {
  super(props);
  this.handlePayment = this.handlePayment.bind(this);
   this.state = {
     paytm_data: {}
   };
  }

  componentDidMount()
  {
    const {order} = this.props.location.state;

    console.log(order);
    // storing the order item in browser cache
    localStorage.setItem('orderData',JSON.stringify(order));

    const data = {
      'MID': order.restaurant.merchant,
      'ORDER_ID':order.id,
      'CUST_ID':order.customer.email,
      'TXN_AMOUNT':order.amount,
    }

    var token = localStorage.getItem('token')
    axios.defaults.headers.common = {
    "Content-Type": "application/json",
    Authorization: `Token ${token}`
    }

    axios
      .post(`http://127.0.0.1:8000/restaurant/paytm/payment/`, data)
      .then(res => {

           if (res.status === 200) {
             // console.log(res.data)
             this.setState({
               paytm_data:res.data
             });
           }
         })
      .catch(err => console.log(err));
  }

  handlePayment()
  {
    console.log('CLICkED');

    axios
      .post(`https://securegw-stage.paytm.in/theia/processTransaction/`, this.state.paytm_data)
      .then(res => {

           console.log(res.data);
         })
      .catch(err => console.log(err));
  }





  render() {
    const { classes } = this.props;
    const {order} = this.props.location.state
    let count=0;
    let items = order.items;
    const quantities = order.quantities;
    const paytm_data = this.state.paytm_data;



    const object = {items:order.items, quantities:order.quantities}
    return (
      <Grid container className={classes.root} spacing={16}>
      <List className={classes.root}
        subheader={<ListSubheader component="div">Your order summary</ListSubheader>}
      >

      {
        items.map(function(item,index)
        {


          return (
            <>
            <ListItem alignItems="flex-start">
              <ListItemText
                primary={item.name +" x "+quantities[index].number}
              />
            </ListItem>
             <Divider variant="inset" className={classes.divider} component="li" />
            </>
            )
        }

       )
      }

       </List>

       <Paper className={classes.paper}>
        <Typography variant="h6" component="h5">
          Total amount : {order.amount}
        </Typography>
      </Paper>


      <form action="https://securegw-stage.paytm.in/theia/processTransaction">
        {

          Object.keys(paytm_data).map(key =>(
            <input  name={key}  value={paytm_data[key]} className={classes.formInput}/>
          )

          )
        }

        <input type="submit" value="Submitsdff" />
      </form>


      <Fab
        variant="extended"
        size="medium"
        color="primary"
        aria-label="Add"
        onClick={this.handlePayment}
        className={classes.fab}
      >
        Pay with paytm
      </Fab>



      </Grid>
    );
  }
}

OrderSummary.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(OrderSummary);