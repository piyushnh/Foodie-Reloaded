import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Fab from '@material-ui/core/Fab';
import Tooltip from '@material-ui/core/Tooltip';
import Badge from '@material-ui/core/Badge';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import { connect } from 'react-redux';



const useStyles = makeStyles(theme => ({
    root: props => {
        if (props.display)
         return {visibility: 'visible' }
        else
            return {visibility: 'hidden' }

      },
  fab: {
    margin: theme.spacing(2),
  },
  absolute: {
    position: 'fixed',
    bottom: theme.spacing(2),
    right: theme.spacing(3),
  },
}));

function CartIcon(props) {
  const classes = useStyles(props.cart);

  

  return (
    <div>
      <Tooltip title="Add" aria-label="add" className={classes.root} >
        <Fab color="secondary" className={classes.absolute}>
            <Badge className={classes.margin} badgeContent={100} max={999} color="primary">
                <ShoppingCartIcon />
            </Badge>
        </Fab>
      </Tooltip>
    </div>
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
  

  export default connect(mapStateToProps, null)(CartIcon);