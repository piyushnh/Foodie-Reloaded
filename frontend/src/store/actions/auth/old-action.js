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
      localStorage.removeItem('token');
      localStorage.removeItem('expirationDate');
      delete axios.defaults.headers.common.Authorization;
    })
    return {
        type: actionTypes.AUTH_LOGOUT
    };
}

export const checkAuthTimeout = expirationTime => {
    return dispatch => {
        setTimeout(() => {
            dispatch(logout());
        }, expirationTime * 1000)
    }
}

export const authLogin = (email, password) => {
    return dispatch => {
        dispatch(authStart());
        axios.post('http://127.0.0.1:8000/rest-auth/login/', {
            email: email,
            password: password
        })
        .then(res => {
            const token = res.data.key;
            // const expirationDate = new Date(new Date().getTime() + 3600 * 1000);
            // localStorage.setItem('token', token);
            // localStorage.setItem('expirationDate', expirationDate);
            dispatch(authSuccess(token));
        })
        .catch(err => {
            dispatch(authFail(err))
        })
    }
}
export const merchantLogin = (email, password) => {
    return dispatch => {
        dispatch(authStart());
        axios.post('http://127.0.0.1:8000/restaurant_merchants/login/', {
            email: email,
            password: password
        })
        .then(res => {
            const token = res.data.key;
            // const expirationDate = new Date(new Date().getTime() + 3600 * 1000);
            // localStorage.setItem('token', token);
            // localStorage.setItem('expirationDate', expirationDate);
            dispatch(authSuccess(token));
        })
        .catch(err => {
            dispatch(authFail(err))
        })
    }
}

export const authSignup = (email, password1, password2) => {
    return dispatch => {
        dispatch(authStart());
        axios.post('http://127.0.0.1:8000/rest-auth/registration/', {
            email: email,
            password1: password1,
            password2: password2
        })
        .then(res => {
            const token = res.data.key;
            const expirationDate = new Date(new Date().getTime() + 3600 * 1000);
            localStorage.setItem('token', token);
            localStorage.setItem('expirationDate', expirationDate);
            dispatch(authSuccess(token));
        })
        .catch(err => {
            dispatch(authFail(err))
        })
    }
}

export const authCheckState = () => {
    return dispatch => {
        const token = localStorage.getItem('token');
        if (token === undefined) {
            dispatch(logout());
        }
         else
         {
              dispatch(authSuccess(token));
          }
        }
    }

// dispatch(checkAuthTimeout(3600));
// dispatch(checkAuthTimeout(3600));
// else {
//     const expirationDate = new Date(localStorage.getItem('expirationDate'));
//     if ( expirationDate <= new Date() ) {
//         dispatch(logout());
//     }
// dispatch(checkAuthTimeout( (expirationDate.getTime() - new Date().getTime()) / 1000) );



