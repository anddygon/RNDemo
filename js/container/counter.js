'use strict'
import Counter from '../components/counter'
import {bindActionCreators} from 'redux'
import {connect} from 'react-redux'
import * as CounterActions from '../actions/counter'


const mapStateToProps = (state) => {
  return {counter: state.counter}
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators(CounterActions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Counter)