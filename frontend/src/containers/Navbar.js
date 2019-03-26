import React, { Component } from 'react';
import PrimarySearchAppBar from './PrimarySearchAppBar';

import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';

const theme = createMuiTheme({
  palette: {
    primary: {
      main:'#3f51b5',
    },
    secondary: {
      main: '#e65100',
    },
  },
  typography: { useNextVariants: true },
});


class Navbar extends Component {
  render(){
   return(
     <MuiThemeProvider theme={theme}>
         <PrimarySearchAppBar color="primary" {...this.props} />
     </MuiThemeProvider>

   );
  }
}

export default Navbar ;
