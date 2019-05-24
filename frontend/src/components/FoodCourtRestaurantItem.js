import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import Icon from '@material-ui/core/Icon';
import { Link } from 'react-router-dom';

import GridList from '@material-ui/core/GridList';
import GridListTile from '@material-ui/core/GridListTile';
import GridListTileBar from '@material-ui/core/GridListTileBar';
import StarBorderIcon from '@material-ui/icons/StarBorder';
import axios from "axios";


const menuItemStyles = theme => ({

  titleBar: {
    background:
      'linear-gradient(to bottom, rgba(0,1.0,0,0.7) 0%, ' +
      'rgba(0,1.0,0,0.3) 70%, rgba(0,1.0,0,0) 100%)',
  },

  title:{
    fontSize:'0.9em',

    whiteSpace:'normal',
    lineHeight:'1.2',
    [theme.breakpoints.up('sm')]: {
      fontSize:'1.2em',
    },

  },
  icon: {
    color: 'white',
  },
  image: {
    width:'100%',

  },
  tile: {

    width:'40%',
    margin: '1em',

  },
  actionIcon:{
    borderRadius: '4px',
    backgroundColor:'#f9ecd1',
    marginRight:'3%',
    lineHeight:'0.5em',
  },
  button:{
    height:'2em',
    minWidth:'3em',
    justifyContent: 'center',
    padding:'0',
    fontSize:'0.9em',
    backgroundColor:'#f2a013',
  },


 icon: {
   fontSize: '1.5em',
 },


});

class PureMenuGridItem extends React.Component {

  constructor(props) {
  super(props);
  this.handleAddButtonClick = this.handleAddButtonClick.bind(this);
  this.handlePlusClick = this.handlePlusClick.bind(this);
  this.handleMinusClick = this.handleMinusClick.bind(this);
  this.state = {
    quantity:0,
  };
 }

  handleAddButtonClick() {
    this.setState({quantity: 1});
    let orderList = this.props.orderList ;
    let item = this.props.data;
    let orderItem = {item:item, quantity: 1 };//hack fix this
    orderList.push(orderItem);
    this.props.onOrderListChange(orderList);

 }

  handlePlusClick() {
    this.setState({quantity: this.state.quantity + 1});
    let orderList = this.props.orderList ;
    let orderItem = orderList.pop();
    orderItem.quantity = this.state.quantity + 1;
    orderList.push(orderItem);
    this.props.onOrderListChange(orderList);
 }

  handleMinusClick() {
    this.setState({quantity: this.state.quantity - 1});
    let orderList = this.props.orderList ;
    let orderItem = orderList.pop();
    if (orderItem.quantity == 1)
    {
    }
    else {
      orderItem.quantity -= 1;
      orderList.push(orderItem);
    }
    this.props.onOrderListChange(orderList);
 }

   render()
   {
     const { classes } = this.props;
     const  item = this.props.data; //item is menuItem
     let quantity =this.state.quantity;
     let button;

     if (!quantity)
     {
       button = (<Button className={classes.button} onClick={this.handleAddButtonClick}>
                    Add
                 </Button>);
     }
     else
     {
       button = (<Button className={classes.button}>
                  <Icon className={classes.icon} onClick={this.handlePlusClick}>add</Icon>
                  {quantity}
                  <Icon className={classes.icon} onClick={this.handleMinusClick}>remove</Icon>
                 </Button>);
     }



     return (

                   <GridListTile key={item.id} className={classes.tile} >
                      <img src={item.image} alt={item.name} className={classes.image}/>
                      <GridListTileBar
                        title={item.name}
                        actionIcon = {button}
                        classes={{root:classes.titleBar, title:classes.title, actionIcon:classes.actionIcon }}
                      />
                  </GridListTile>


                 )

   }



}

const MenuGridItem = withStyles(menuItemStyles)(PureMenuGridItem);


const menuStyles = theme => ({
  root: {
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'space-around',
    overflow: 'hidden',
    backgroundColor: theme.palette.background.paper,
  },
  gridList: {
    width: '400',
    height: '450',
    // Promote the list into his own layer on Chrome. This cost memory but helps keeping high FPS.
    transform: 'translateZ(0)',
  },
  titleBar: {
    background:
      'linear-gradient(to bottom, rgba(0,1.0,0,0.7) 0%, ' +
      'rgba(0,1.0,0,0.3) 70%, rgba(0,1.0,0,0) 100%)',
  },

  title:{
    fontSize:'0.9em',

    whiteSpace:'normal',
    lineHeight:'1.2',
    [theme.breakpoints.up('sm')]: {
      fontSize:'1.2em',
    },

  },
  icon: {
    color: 'white',
  },
  image: {
    width:'100%',

  },
  tile: {

    width:'40%',
    margin: '1em',

  },
  actionIcon:{
    borderRadius: '4px',
    backgroundColor:'#f9ecd1',
    marginRight:'3%',
    lineHeight:'0.5em',
  },
  button:{
    // height:'3px',
    // width:'5px',
    minWidth:'0',
    justifyContent: 'center',
    padding:'0',
    // fontSize:'0.9em',
    backgroundColor:'#f2a013',
  },


});

class PureMenuGridList extends React.Component {

  constructor(props) {
  super(props);
  this.onOrderListChange = this.onOrderListChange.bind(this);
  this.onOrderPlacement = this.onOrderPlacement.bind(this);
  this.state = {
    categories : [],
    orderList: [],
  };
 }

 componentWillMount()
 {
   const {restaurantID} = this.props.location.state
   var token = localStorage.getItem('token')
   axios.defaults.headers.common = {
   "Content-Type": "application/json",
   Authorization: `Token ${token}`
   }

   axios
     .get(`http://127.0.0.1:8000/restaurant/menuitems/${restaurantID}`)
     .then(res => this.setState({ categories: res.data }) )
     .catch(err => console.log(err));
 }

 onOrderListChange(orderList){
   this.setState({orderList: orderList});
 }

 onOrderPlacement(){

   let orderList = this.state.orderList;

   if (! orderList[0])
   {
     alert("Please Add Items");
   }
   else {
     const {restaurantID} = this.props.location.state
     const {restaurantName} = this.props.location.state
     var token = localStorage.getItem('token')
     axios.defaults.headers.common = {
     "Content-Type": "application/json",
     Authorization: `Token ${token}`
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


  render()
  {
    const { classes } = this.props;
    const  categories = this.state.categories;
    const  orderList = this.state.orderList;

    return (
      <div className={classes.root}>
        <GridList cellHeight={500} spacing={10} className={classes.gridList}>

        {
          categories.map(category => (

            <>
              {
                category.items.map
              (item =>
                (

                  <MenuGridItem data={item} orderList={orderList} onOrderListChange={this.onOrderListChange}  />
                )

              )

              }

            </>
          )


          )

        }



        </GridList>

        <Button variant="contained" color="primary" onClick={this.onOrderPlacement} className={classes.button}>
          Place Order
        </Button>
      </div>
    )
  }


}

PureMenuGridList.propTypes = {
  classes: PropTypes.object.isRequired,
};

const MenuGridList = withStyles(menuStyles)(PureMenuGridList);



const styles = theme => ({
  card: {
    display: 'flex',
    margin: '0 25% 0 25%'

  },
  details: {
    display: 'flex',
    flexDirection: 'column',
  },
  content: {
    flex: '1 0 auto',
  },
  cover: {
    width: 151,
  },
  controls: {
    display: 'flex',
    alignItems: 'center',
    paddingLeft: theme.spacing.unit,
    paddingBottom: theme.spacing.unit,
  },
  playIcon: {
    height: 38,
    width: 38,
  },
  button: {
   margin: theme.spacing.unit,
 },

});

function FoodCourtRestaurantItem (props) {
  const { classes, theme } = props;
  const restaurant = props.data;



  return (
    <Card className={classes.card}>
      <div className={classes.details}>
        <CardContent className={classes.content}>
          <Typography component="h5" variant="h5">
            {restaurant.name}
          </Typography>
          <Typography variant="subtitle1" color="textSecondary">
            {restaurant.address}
          </Typography>
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

FoodCourtRestaurantItem.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};


export {MenuGridList};
export default withStyles(styles, { withTheme: true })(FoodCourtRestaurantItem);
