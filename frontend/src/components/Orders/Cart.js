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
import { connect } from 'react-redux';
import * as actions from '../../store/actions/order/action';




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


class Cart extends React.Component {

  constructor(props) {
  super(props);
  this.proceedToPayment = this.proceedToPayment.bind(this);
   this.state = {
     paytm_data: {}
   };
  }

  // componentDidMount()
  // {
  //   const {order} = this.props.location.state;

  //   console.log(order);
  //   // storing the order item in browser cache
  //   localStorage.setItem('orderData',JSON.stringify(order));

  //   const data = {
  //     'MID': order.restaurant.merchant,
  //     'ORDER_ID':order.id,
  //     'CUST_ID':order.customer.email,
  //     'TXN_AMOUNT':order.amount,
  //   }

  //   var token = localStorage.getItem('token')
  //   axios.defaults.headers.common = {
  //   "Content-Type": "application/json",
  //   Authorization: `Token ${token}`
  //   }

  //   axios
  //     .post(`http://127.0.0.1:8000/restaurant/paytm/payment/`, data)
  //     .then(res => {

  //          if (res.status === 200) {
  //            // console.log(res.data)
  //            this.setState({
  //              paytm_data:res.data
  //            });
  //          }
  //        })
  //     .catch(err => console.log(err));
  // }
  onOrderPlacement(){
  
    let orderList = this.orderList;
 
    if (! orderList[0])
    {
      alert("Please Add Items");
    }
    else {

      const {restaurant} = this.props.location.state
      const restaurantID = restaurant.id
      const restaurantName = restaurant.name
      axios.defaults.headers.common = {
      "Content-Type": "application/json",
      Authorization: `Token ${this.props.token}`
      }
 
      axios
        .post(`http://127.0.0.1:8000/restaurant/foodcourt/restaurants/${restaurantID}/order/`, this.state.orderList)
        .then(res => {
 
             if (res.status === 201) {
 
               console.log(res.data);
 
               this.props.history.push({
                 pathname:'/foodcourts/'+restaurantName+'/order/',
                 state:{order:res.data}
               });
 
             }
           })
        .catch(err => console.log(err));
    }
 
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

proceedToPayment()
{
  const cart = this.props.cart;
  axios.defaults.headers.common = {
  "Content-Type": "application/json",
  Authorization: `Token ${this.props.token}`
  }

  axios
    .post(`http://127.0.0.1:8000/restaurant/foodcourt/restaurants/order/create/`, cart)
    .then(res => {

         if (res.status === 201) {

          this.props.setOrderData(res.data);
           this.props.history.push({
             pathname:'/foodcourts/restaurants/payment'
           });

         }
       })
    .catch(err => console.log(err));
}





  render() {
    const { classes } = this.props;
    const orderList = this.props.cart.orderList;
    let count=0;
    // let items = order.items;
    // const quantities = order.quantities;
    const paytm_data = this.state.paytm_data;



    // const object = {items:order.items, quantities:order.quantities}
    return (
      <Grid container className={classes.root} spacing={16}>
      <List className={classes.root}
        subheader={<ListSubheader component="div">Your order summary</ListSubheader>}
      >

      {
        orderList.map(function(element)
        {


          return (
            <>
            <ListItem alignItems="flex-start">
              <ListItemText
                primary={element.item.name +" x "+element.quantity}
              />
            </ListItem>
             <Divider variant="inset" className={classes.divider} component="li" />
            </>
            )
        }

       )
      }

       </List>

       

      {/*
      <form action="https://securegw-stage.paytm.in/theia/processTransaction">
        {

          Object.keys(paytm_data).map(key =>(
            <input  name={key}  value={paytm_data[key]} className={classes.formInput}/>
          )

          )
        }

        <input type="submit" value="Submitsdff" />
      </form>
      */}


      <Fab
        variant="extended"
        size="medium"
        color="primary"
        aria-label="Add"
        onClick={this.proceedToPayment}
        className={classes.fab}
      >
        Pay with paytm
      </Fab>



      </Grid>
    );
  }
}

Cart.propTypes = {
  classes: PropTypes.object.isRequired,
};

const mapStateToProps = (state) => {
  return {
     cart: state.orderPageReducer.cart,
    token: state.authReducer.token

  }
}

  const mapDispatchToProps = dispatch => {
  return {
      setOrderData: (orderData) => dispatch(actions.setOrderData(orderData))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(Cart));
// <GridItem xs={12} sm={12} md={6}>
// <Card>
//   <CardHeader color="warning">
//     <h4 className={classes.cardTitleWhite}>Employees Stats</h4>
//     <p className={classes.cardCategoryWhite}>
//       New employees on 15th September, 2016
//     </p>
//   </CardHeader>
//   <CardBody>
//     <Table
//       tableHeaderColor="warning"
//       tableHead={["ID", "Name", "Salary", "Country"]}
//       tableData={[
//         ["1", "Dakota Rice", "$36,738", "Niger"],
//         ["2", "Minerva Hooper", "$23,789", "Curaçao"],
//         ["3", "Sage Rodriguez", "$56,142", "Netherlands"],
//         ["4", "Philip Chaney", "$38,735", "Korea, South"]
//       ]}
//     />
//   </CardBody>
// </Card>
// </GridItem>