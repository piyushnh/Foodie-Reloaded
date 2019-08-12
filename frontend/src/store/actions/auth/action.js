import axios from 'axios';
import * as actionTypes from './actionTypes';


export const authStart = () => {
    return {
        type: actionTypes.AUTH_START
    }
}



export const authSuccess = token => {
    return {
        type: actionTypes.AUTH_SUCCESS,
        token: token
    }
}

export const authFail = error => {
    return {
        type: actionTypes.AUTH_FAIL,
        error: error
    }
}


export const logout = () => {

    axios.post('http://127.0.0.1:8000/rest-auth/logout/')
    .then(res => {
      delete axios.defaults.headers.common.Authorization;
    })
    return {
        type: actionTypes.AUTH_LOGOUT
    };
}


export const authLogin = (token) => {
    return dispatch => {
        dispatch(authStart());
       
        axios.defaults.headers.common = {
            "Content-Type": "application/json",
            Authorization: `Token ${token}`
            }
            console.log(token);
        dispatch(authSuccess(token));
    }
}







