'use strict'
import React, { Component } from 'react'
import {NativeEventEmitter, NativeModules} from 'react-native'
import {Provider} from 'react-redux'
import Counter from '../container/counter'
import store from '../store/index'
const myModuleEvt = new NativeEventEmitter(NativeModules.JSEventEmitter)

export default class App extends Component {

  componentWillMount() {
    this.subscription = myModuleEvt.addListener(
      'uploadProgress',
      (name) => {
        console.log(name, 'this name from native')
      }
    )
  }

  componentWillUnmount() {
    this.subscription.remove()
  }

  render() {
    return (
      <Provider store={store}>
        <Counter/>
      </Provider>
    )
  }

}