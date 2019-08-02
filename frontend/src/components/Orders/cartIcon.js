import React, { useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Tooltip from '@material-ui/core/Tooltip';
import Badge from '@material-ui/core/Badge';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import { connect } from 'react-redux';
import Typography from '@material-ui/core/Typography';
import Fab from '@material-ui/core/Fab';



const useStyles = makeStyles(theme => ({
    root: props => {
        if (props.display)
         return {visibility: 'visible' }
        else
            return {visibility: 'hidden' }

      },
  fab: {
    width: '100%',
    justifyContent: 'space-between',
    textTransform: 'none',
    backgroundColor: '#71b83d',
    margin: '3px 10px 0 10px'
  },
  badge: {
      marginRight: '1em',
  },
  cart: {
      width: '1.5em',
      height: '1.2em'
  },
  label: {
      fontWeight: 'bold',
      color: 'white'
  }
//   absolute: {
//     position: 'fixed',
//     bottom: '70px',
//     right: theme.spacing(3),
//   },
}));

function CartIcon(props) {
  const classes = useStyles(props.cart);

//   const [amount, setAmount] = useState(0);

  function calculateAmount(props){
    let orderList = props.cart.orderList;
    let tempAmount = 0;

    orderList.forEach(element => {
        tempAmount += element.item.price * element.quantity;
    });

    return <Typography variant="body2" component="p">
    &#x20b9;{tempAmount}
    </Typography>
  }
  



  return (
    <Fab variant="extended"  className={`${classes.fab} ${classes.root}`}>
        <Typography className = {classes.label}>
            GO TO CART
        </Typography>
        <Badge className={classes.badge} badgeContent={calculateAmount(props)} color="primary">
           <ShoppingCartIcon className={classes.cart}/>
        </Badge>
      </Fab>
  );
}

const mapStateToProps = (state) => {
    return {
       cart: state.orderPageReducer.cart,
    }
}

//   const mapDispatchToProps = dispatch => {
//   return {
//     handleMenuItemClick: (orderList, type) => dispatch(actions.handleMenuItemClick(orderList, type)),
//     resetCart: (restaurant, orderList) => dispatch(actions.resetCart(restaurant, orderList)),
//   }
// }

// <div>
// <Tooltip title="Add" aria-label="add" className={classes.root} >
//   <Fab color="secondary" className={classes.absolute}>
//       <Badge className={classes.margin} badgeContent={calculateAmount(props)} color="primary">
//           <ShoppingCartIcon />
//       </Badge>
//   </Fab>
// </Tooltip>
// </div>
  

  export default connect(mapStateToProps, null)(CartIcon);