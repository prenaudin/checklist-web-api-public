import * as types from '../constants/ActionTypes'
import store from './store'
import _ from 'lodash'

console.log('Hoodie hostnae :', document.location.hostname);

const hoodie = new Hoodie({
  url: 'http://' + document.location.hostname +':8080'
})

hoodie.store.on('project:add', (projectData) => {
  store.dispatch({type: types.INSERT_PROJECT, project: projectData})
});

hoodie.account.on('signin', (accountData) => {
  store.dispatch({type: types.SIGN_IN, account: accountData})
});

// Export hoodie for debugging purpose
window.hoodie = hoodie;

export default hoodie;
