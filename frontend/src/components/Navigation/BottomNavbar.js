import React from 'react';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import Icon from '@material-ui/core/Icon';
import { Link } from 'react-router-dom';

import { withStyles } from '@material-ui/core/styles';



const styles = theme => ({
    root: {
        width: '100%',
        position: 'fixed',
        bottom: 0,
        marginTop:'1px',
      },
      icon: {
        //   color:'rgba(0, 0, 0, 0.54)',
      },
      footer: {
          position: 'sticky',
          bottom:'0',
      }
  });
  

function BottomNavbar(props) {
  const {classes} = props;
  const [value, setValue] = React.useState(0);

  return (
    <BottomNavigation
      value={value}
      onChange={(event, newValue) => {
        setValue(newValue);
      }}
      showLabels
      className={classes.root}
    >
      <BottomNavigationAction label="Home" 
      icon={ <Link to="/"><Icon className={classes.icon} >home</Icon></Link>} />
      <BottomNavigationAction className={classes.tab} label="Food Courts"
       icon={<Link to="/nearbyfoodcourts/"><Icon className={classes.icon} >fastfood</Icon></Link>} />
      <BottomNavigationAction label="Account"
       icon={<Link to="/"><Icon className={classes.icon} >person</Icon></Link>} />
    </BottomNavigation>
  );
}

export default withStyles(styles)(BottomNavbar);