import * as types from '../constants/ActionTypes'
import hoodie from '../store/hoodie'
import store from '../store/store'
import _ from 'lodash'

export function fetchAccount() {
  return (dispatch, getState) => {
    hoodie.account.fetch().then((accountData) => {
      console.log(accountData);
    })
  }
}
