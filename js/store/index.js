import {createStore, applyMiddleware, compose} from 'redux'
import thunk from 'redux-thunk'
import rootReducer from '../reducers/index'
import {asyncMiddleware} from 'redux-amrc'

const enhancer = compose(
  applyMiddleware(thunk, asyncMiddleware)
)

const store = createStore(
  rootReducer,
  enhancer
)

export default store