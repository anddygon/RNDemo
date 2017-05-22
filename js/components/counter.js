'use strict'
import React, { Component, PropTypes } from 'react'
import {View, Text, StyleSheet, TouchableOpacity} from 'react-native'
import {connect} from 'react-redux'
import {bindActionCreators} from 'redux'
import * as CounterActions from '../actions/counter'

class Counter extends Component {

  static propTypes = {
    increment: PropTypes.func.isRequired,
    decrement: PropTypes.func.isRequired,
    incrementIfOdd: PropTypes.func.isRequired,
    incrementAsync: PropTypes.func.isRequired,
    counter: PropTypes.object.isRequired,
  }

  render() {
    const {increment, decrement, incrementIfOdd, incrementAsync, counter} = this.props
    return (
      <View style={styles.container}>
        <Text>Clicked: {counter.count} times</Text>
        <View style={{flexDirection: 'row', marginTop: 20, flexWrap: 'wrap'}}>
          <Text style={styles.button} onPress={increment}> + </Text>
          <Text style={styles.button} onPress={decrement}> - </Text>
          <Text style={styles.button} onPress={incrementIfOdd}> Increment if odd </Text>
          <Text style={styles.button} onPress={() => incrementAsync(5000)}> Increment async </Text>
        </View>
      </View>
    )
  }

}

const mapStateToProps = (state) => {
  return {counter: state.counter}
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators(CounterActions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Counter)

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center'
  },
  button: {
    borderWidth: 1,
    borderColor: 'gray',
    marginLeft: 8
  }
})