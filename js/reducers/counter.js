import {INCREMENT, DECREMENT} from '../actions/counter'

const defaultState = {
  count: 6
}

export default function counter(state = defaultState, action) {
  switch (action.type) {
    case INCREMENT:
      return {...state, count: state.count + 1}
    case DECREMENT:
      return {...state, count: state.count - 1}
    default:
      return state
  }
}
