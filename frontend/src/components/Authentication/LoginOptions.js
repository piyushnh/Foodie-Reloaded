import React from 'react';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import Slide from '@material-ui/core/Slide';
import { connect } from 'react-redux';
import { withStyles } from '@material-ui/core/styles';
import GoogleLogin from './Google/login';


const styles = theme => ({
    root: {
      display: 'flex',
      flexWrap: 'wrap',
      justifyContent: 'space-around',
      alignContent:'space-between',
    //   overflow: 'hidden',
      backgroundColor: theme.palette.background.paper,
      // bottom: '50px',
    },

  
  
  });
  



class LoginDialog extends React.Component {
    constructor(props) {
        super(props);
      //   this.state = {
      //     open: false
      //  }
      
      }

  


  render()
  {

    // const Transition = React.forwardRef(function Transition(props, ref) {
    //   return <Slide direction="up" ref={ref} {...props} />;
    // });

    return (
      <div>
        
        <Dialog
          open={this.props.open}
          onClose={this.props.handleClose}
          aria-labelledby="alert-dialog-slide-title"
          aria-describedby="alert-dialog-slide-description"
        >
          <DialogTitle id="alert-dialog-slide-title">{"Sign In options"}</DialogTitle>
          <GoogleLogin />
          <DialogActions>
          <Button onClick={this.props.handleClose} color="primary">
            Later
          </Button>
        </DialogActions>
        </Dialog>
      </div>
    );
  }

  
}

// const mapStateToProps = (state) => {
//     return {
//        restaurant: state.currentRestaurant,
//        cart: state.orderPageReducer.cart
//     }
// }

//   const mapDispatchToProps = dispatch => {
//   return {
//       setCurrentRestaurant: (restaurant) => dispatch(actions.setCurrentRestaurant(restaurant))
//   }
// }
  
  export default connect(null, null)(withStyles(styles)(LoginDialog));