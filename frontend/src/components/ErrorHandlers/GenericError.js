import React from 'react';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import {Link} from 'react-router-dom';
import { withRouter } from "react-router";



class GenericError extends React.Component {
    constructor(props) {
      super(props);
      this.handleClose = this.handleClose.bind(this);
      this.state = { hasError: false};
    }
  
    static getDerivedStateFromError(error) {
      // Update state so the next render will show the fallback UI.
      return { hasError: true };
    }
  
    componentDidCatch(error, errorInfo) {
      // You can also log the error to an error reporting service
      // this.setState({error: string(error)});
    }
  
    handleClose()
    {
        this.props.history.push("/");
        this.setState({hasError: false });
    }

    render() {
      if (this.state.hasError) {
        // You can render any custom fallback UI
        return (
        <Dialog
            open={true}
            // onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">{'Oops! Something went wrong!'}</DialogTitle>

            <DialogActions>
            <Button onClick={this.handleClose} color="primary" autoFocus>
                Okay!
            </Button>
            </DialogActions>
        </Dialog>
        );
      }


  
      return this.props.children; 
    }
  }

  export default withRouter(GenericError);