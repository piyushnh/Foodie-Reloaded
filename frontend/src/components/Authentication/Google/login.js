import React from 'react';
import GoogleLogin from 'react-google-login';
import { connect } from 'react-redux';
import { withStyles } from '@material-ui/core/styles';
import {CLIENT_ID} from './authCredentials';
import  axios from 'axios';
import * as actions from '../../../store/actions/auth/action';


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
  



class GoogleAuth extends React.Component {
    constructor(props) {
        super(props);
      //   this.state = {
      //     open: false
      //  }
      this.onLogin = this.onLogin.bind(this);  
      this.onGoogleSignOut = this.onGoogleSignOut.bind(this);  
      }

  // handleClickOpen() {
  //   this.setState({open:true});
  //   }
  onLogin(response)
  { 
    
    if (response.code)
    {   

        axios.defaults.headers.common = {
            "Content-Type": "application/json",
            'X-Requested-With': 'XMLHttpRequest'
            }

         
            axios
              .post(`http://127.0.0.1:8000/auth/social/exchange_auth/`, response)
              .then(res => {
                console.log(res);
                
                
                axios
                  .post(`http://127.0.0.1:8000/auth/social/exchange_token/google-oauth2/`, res.data)
                  .then(res => {
                    console.log(res);
                    this.props.authLogin(res.data);


                   } )
                  .catch(err => console.log(err));
              
              } )
              .catch(err => console.log(err));
    }

  }
  onGoogleSignOut()
  { 
    // var auth2 = gapi.auth2.getAuthInstance();
    // auth2.signOut().then(function () {
    //   console.log('User signed out.');
    // });

  }


  render()
  {

    return (
        <GoogleLogin
            clientId={CLIENT_ID}
            buttonText="Login"
            responseType = 'code'
            accessType = 'offline'
            onSuccess={this.onLogin}
            onFailure={this.onLogin}
            cookiePolicy={'single_host_origin'}
        />
    );
  }

  
}

// const mapStateToProps = (state) => {
//     return {
//        restaurant: state.currentRestaurant,
//        cart: state.orderPageReducer.cart
//     }
// }

  const mapDispatchToProps = dispatch => {
  return {
      authLogin: (token) => dispatch(actions.authLogin(token))
  }
}
  
  export default connect(null, mapDispatchToProps)(withStyles(styles)(GoogleAuth));