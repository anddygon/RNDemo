import {ASYNC} from 'redux-amrc'
// action types
const INCREMENT = 'INCREMENT'
const DECREMENT = 'DECREMENT'

export {INCREMENT,  DECREMENT}

// action functions
const increment = () => {
  return {
    type: INCREMENT
  }
}

const decrement = () => {
  return {
    type: DECREMENT
  }
}

const incrementIfOdd = () => {
  return (dispatch, getState) => {
    //获取state中的count属性
    const {counter} = getState()
    //偶数返回
    if (counter.count % 2 === 0) {
      return
    }
    //执行加1操作
    dispatch(increment())
  }
}

const incrementAsync = (delay = 3000) => {
  return dispatch => {
    setTimeout(() => {
      dispatch(increment())
    }, delay)
  }
}

export {increment, decrement, incrementIfOdd, incrementAsync}