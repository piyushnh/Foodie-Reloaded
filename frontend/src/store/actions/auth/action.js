import axios from 'axios';
import * as actionTypes from './actionTypes';


export const authStart = () => {
    return {
        type: actionTypes.AUTH_START
    }
}

export const getUser = (user) => {
    return {
        type: actionTypes.GET_USER,
        user:user
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


export const authLogin = (data) => {
    return dispatch => {
        dispatch(authStart());
        axios.defaults.headers.common = {
            "Content-Type": "application/json",
            Authorization: `Token ${data.token}`
            }      
        axios.get(`http://127.0.0.1:8000/user/details/${data.user_id}`)
        .then(res => {
          dispatch(getUser(res.data));
        })
        .catch()
        
        dispatch(authSuccess(data.token));
    }
}







