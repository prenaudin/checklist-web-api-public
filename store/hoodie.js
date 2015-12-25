import * as types from '../constants/ActionTypes'
import store from './store'
import _ from 'lodash'

const hoodie = new Hoodie('http://127.0.0.1:6001')

hoodie.store.on('project:add', (projectData) => {
  store.dispatch({type: types.INSERT_PROJECT, project: projectData})
});

hoodie.account.on('signin', (accountData) => {
  store.dispatch({type: types.SIGN_IN, account: accountData})
});

// Export hoodie for debugging purpose
window.hoodie = hoodie;

export default hoodie;
