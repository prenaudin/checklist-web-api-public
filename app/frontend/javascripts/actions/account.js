import * as types from '../constants/ActionTypes'
import store from '../store/store'
import api from '../api/api'
import _ from 'lodash'

export function signin(data) {
  return (dispatch, getState) => {
    return api.signin({data}).then((resp) => {
      dispatch({ type: types.SIGNIN, data: resp.data })
    })
  }
}

export function validateToken() {
  return (dispatch, getState) => {
    return api.validateToken().then((resp) => {
      dispatch({ type: types.SIGNIN, data: resp.data })
    })
  }
}
