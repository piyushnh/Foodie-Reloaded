import GridListTile from '@material-ui/core/GridListTile';
import GridListTileBar from '@material-ui/core/GridListTileBar';
import Icon from '@material-ui/core/Icon';
import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';


const styles = theme => ({

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
     fontSize: '1.5em',

    },
    itemImage: {
      width:'100%',
      transform: 'none',
      height: '100px',
    },
    root: {
  
      width:'49%',
      margin: '0.1em',
  
    },
    tile: {
        // transform: 'none',
      },
    actionIcon:{
      borderRadius: '4px',
      backgroundColor:'#f9ecd1',
      lineHeight:'0.5em',
      justifyContent: 'space-between',
      width: '100%',
    },
    button:{
      height:'2em',
      minWidth:'3em',
      justifyContent: 'center',
      padding:'0',
      fontSize:'0.9em',
      backgroundColor:'#f2a013',
    },
    cardContent:{
        display: 'flex',

        paddingLeft:'5px',
        padding: '10px',
    },
    vegIcon: {
        width: '1.2em',
        height: '1.1em',
        alignSelf: 'center'

    },
    card: {
        display: 'flex',
        alignContent: 'space-between',
        flexWrap: 'wrap',   
    }
  
  });
  
  class MenuGridItem extends React.Component {
  
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
       let vegIcon;
  
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

       if (item.classification === 'non-vegetarian' || item.classification === 'Non-Vegetarian' )
       {
           vegIcon = (<img className={classes.vegIcon} src="https://img.icons8.com/color/48/000000/non-vegetarian-food-symbol.png"></img>);
       }
       else
       {
        vegIcon = (<img className={classes.vegIcon} src="https://img.icons8.com/color/48/000000/vegetarian-food-symbol.png"></img>);

       }
  
  
       return (
                    <div className={classes.root}>
                     <GridListTile key={item.id} className={classes.tile} >
                        <img src={item.image} alt={item.name} className={classes.itemImage}/>
                    </GridListTile>
                    <Card className={classes.card}>
                        <CardContent className={classes.cardContent}>                            
                            {vegIcon}                        
                            <Typography variant="body2" component="p">
                            {item.name}                        
                            </Typography>
                        </CardContent>
                        <CardActions className={classes.actionIcon}>
                            <Typography variant="body2" component="p">
                            &#x20b9;{item.price}
                            </Typography>
                            {button}
                        </CardActions>
                    </Card>
                    </div>
  
  
                   )
  
     }
  
  
  
  }
  

  export default withStyles(styles)(MenuGridItem);