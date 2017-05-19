'use strict'
import React, { Component } from 'react'

import {Provider} from 'react-redux'
import {createStore, applyMiddleware, compose} from 'redux'
import thunk from 'redux-thunk'
import rootReducer from '../reducers/index'
const store = compose(applyMiddleware(thunk))(createStore)(rootReducer)

import Counter from '../components/counter'

export default class App extends Component {

  render() {
    return (
      <Provider store={store}>
        <Counter/>
      </Provider>
    )
  }

}