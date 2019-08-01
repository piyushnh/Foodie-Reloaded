import { combineReducers } from 'redux'
import authReducer from './auth'
import orderPageReducer from './order'

export default combineReducers({
    authReducer,
    orderPageReducer
  })
