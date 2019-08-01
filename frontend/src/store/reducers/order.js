import * as actionTypes from '../actions/order/actionTypes';
import { updateObject } from '../utility';

const initialState = {
    cart: {
        restaurant: null,
        orderList: [],
    },
    currentRestaurant: null,

}

const resetCart = (state, action) => {
    return {...state, 
        cart: {
            restaurant: action.cart.restaurant,
            orderList: action.cart.orderList
        }
    };
}

const setCurrentRestaurant = (state, action) => {
    return {...state, 
        currentRestaurant: action.currentRestaurant
    };
}

const setOrderList = (state, action) => {
    return {...state, 
        cart: {
            ...state.cart,
            orderList: action.orderList
        }
    };
}





const orderPageReducer = (state=initialState, action) => {
    switch (action.type) {
        
        case actionTypes.CURRENT_RESTAURANT: return setCurrentRestaurant(state, action);
        case actionTypes.ORDERLIST_CHANGED: return setOrderList(state, action);
        case actionTypes.RESET_CART: return resetCart(state, action);
        default:
            return state;
    }
}

export default orderPageReducer;
