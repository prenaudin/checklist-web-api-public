import * as types from '../constants/ActionTypes'
import store from '../store/store'
import api from '../api/api'
import _ from 'lodash'
import history from '../config/history'

export function signin(data) {
  return (dispatch, getState) => {
    return api.signin({data}).then((resp) => {
      dispatch({ type: types.SIGNIN, data: resp.data })
      history.pushState(null, '/projects')
    })
  }
}

export function signup(data) {
  return (dispatch, getState) => {
    return api.signup({data}).then((resp) => {
      dispatch({ type: types.SIGNUP, data: resp.data })
      history.pushState(null, '/projects')
    })
  }
}

export function signout(data) {
  return (dispatch, getState) => {
    return api.signout().then((resp) => {
      dispatch({ type: types.SIGNOUT, data: {} })
      history.pushState(null, '/home')
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
