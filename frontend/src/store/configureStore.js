import { createStore, compose, applyMiddleware } from 'redux';
import { persistStore, persistReducer } from 'redux-persist'
import storage from 'redux-persist/lib/storage' // defaults to localStorage for web and AsyncStorage for react-native
import thunk from 'redux-thunk';
import autoMergeLevel2 from 'redux-persist/lib/stateReconciler/autoMergeLevel2'
 
import rootReducer from './reducers/index'

const composeEnhances = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose

const persistConfig = {
  key: 'root',
  storage,
  stateReconciler: autoMergeLevel2,
  whitelist: ['orderPageReducer', 'authReducer']
}
 
const persistedReducer = persistReducer(persistConfig, rootReducer)
 

 export const store = createStore(persistedReducer, composeEnhances(
    applyMiddleware(thunk)
));
export const persistor = persistStore(store)
