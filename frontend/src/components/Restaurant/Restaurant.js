import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import { Link } from 'react-router-dom';


const styles = theme => ({
  card: {
    display: 'flex',
    

  },
  details: {
    display: 'flex',
    flexDirection: 'column',
  },
  content: {
    flex: '1 0 auto',
  },
  cover: {
    // width: 151,
    width: '25%',
    alignItems: 'flex-end',

  },
  controls: {
    display: 'flex',
    alignItems: 'center',
    paddingLeft: theme.spacing(1),
    paddingBottom: theme.spacing(1),
  },
  playIcon: {
    height: 38,
    width: 38,
  },
  button: {
   margin: theme.spacing(1),
 },

});

function Restaurant (props) {
  const { classes } = props;
  const restaurant = props.data;



  return (
    <Card className={classes.card}>
      <div className={classes.details}>
        <CardContent className={classes.content}>
          <Typography >
            {restaurant.name}
          </Typography>
           {/*<Typography variant="subtitle1" color="textSecondary">
             {restaurant.address} 
          </Typography> */}
        </CardContent>
        <div className={classes.controls}>
          <Button variant="outlined"   color="primary" className={classes.button}>
            <Link to = {{pathname:'/foodcourts/'+restaurant.name+'/menu', state: { restaurantID: restaurant.id, restaurantName: restaurant.name}}}>
              View Menu
            </Link>
          </Button>
        </div>
      </div>
      <CardMedia
        className={classes.cover}
        image={restaurant.cover_pic}
        title="Live from space album cover"
      />
    </Card>
  );
}

Restaurant.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};


export default withStyles(styles, { withTheme: true })(Restaurant);
