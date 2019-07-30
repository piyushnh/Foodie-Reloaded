import GridList from '@material-ui/core/GridList';
import axios from "axios";
import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import MenuGridItem from './MenuItem';
import Paper from '@material-ui/core/Paper';
import LoadingSpinner from '../Utility/LoadingSpinner';
import Typography from '@material-ui/core/Typography';


  
  const styles = theme => ({
    root: {
      display: 'flex',
      flexWrap: 'wrap',
      justifyContent: 'space-around',
      alignContent:'space-between',
    //   overflow: 'hidden',
      backgroundColor: theme.palette.background.paper,
    },
    gridList: {
    //   width: '400',
    //   height: '450',
      // Promote the list into his own layer on Chrome. This cost memory but helps keeping high FPS.
      transform: 'translateZ(0)',
      marginTop:'100px',

      
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
    orderButton:{
      width:'100%',
      justifyContent: 'center',
      // marginTop: '4em',
    //   bottom:'0',
    //   position: 'relative',
      backgroundColor:'#f2a013',
    },
  
  
  });
  
  class MenuGridList extends React.Component {
  
    constructor(props) {
    super(props);
    this.onOrderListChange = this.onOrderListChange.bind(this);
    this.onOrderPlacement = this.onOrderPlacement.bind(this);
    this.state = {
      categories : [],
      orderList: [],
      loading: true,
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
       .then(res => this.setState({ categories: res.data, loading: false }) )
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

      let menu;

      if (this.state.loading)
        menu = <LoadingSpinner></LoadingSpinner>;
      else
      {
          menu =  <>
          <div className="container">
          <GridList cellHeight={500} style={{margin: '1em 0 0 0'}} className={classes.gridList}>
  
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
          </div>
  
          <Button variant="contained" color="primary" onClick={this.onOrderPlacement} className={classes.orderButton}>
            <p>{orderList.length + 'items' }</p>
          Place Order
          </Button>
          </> ;
          
      }

  
      return (
        <Paper className={classes.root}>
            {menu}
        </Paper>
        )
    }
  
  
  }
  
  MenuGridList.propTypes = {
    classes: PropTypes.object.isRequired,
  };
  
  export default withStyles(styles)(MenuGridList);
  