import axios from 'axios';
import * as actionTypes from './actionTypes';

export const resetCart = (restaurant, orderList) => {
    return {
        type: actionTypes.RESET_CART,
        cart: {
            restaurant: restaurant,
            orderList: orderList,
        }
    }
}

export const setCurrentRestaurant = (restaurant) => {
    return {
        type: actionTypes.CURRENT_RESTAURANT,
        currentRestaurant: restaurant,
    }
}

export const orderListChange = (orderList) => {
return {
    type: actionTypes.ORDERLIST_CHANGED,
    orderList: orderList,
}
}

export const handleMenuItemClick = (item, type) => {
return (dispatch, getState) => {
let cart = getState().orderPageReducer.cart;
let orderList = cart.orderList ;
let currentRestaurant = getState().orderPageReducer.currentRestaurant;

function getIndex(){
    let index = -1;
    orderList.forEach((element,ind) => {
        if (element.item.id === item.id)
            index = ind;
    });
    return index;
}    
let index = getIndex();
let orderItem = orderList[index];



switch (type) {
    
    case 'ADD': 
                let temp = {item:item, quantity: 1 };//hack fix this
                orderList.push(temp);
                break;
    case 'PLUS': orderList[index].quantity += 1;
                break;
    case 'MINUS':  if (orderItem.quantity == 1)
                    {
                        orderList.splice(index, 1);
                        if (orderList.isEmpty)
                            dispatch(resetCart(null, []));
                    }
                    else {
                        orderList[index].quantity -= 1;
                    }
    // default: null;
    
}
dispatch(orderListChange(orderList));


}   

}