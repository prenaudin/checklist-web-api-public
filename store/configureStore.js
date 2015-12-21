import * as types from '../constants/ActionTypes'
import PouchMiddleware from 'pouch-redux-middleware'
import { createStore, applyMiddleware } from 'redux'
import Immutable from 'immutable'
import rootReducer from '../reducers'
import PouchDB from 'pouchdb'
import PouchSync from 'pouch-websocket-sync'

const syncEvents = ['change', 'paused', 'active', 'denied', 'complete', 'error'];
const clientEvents = ['connect', 'disconnect', 'reconnect'];

const initialState = {
  projects: new Immutable.Map(),
  checklists: new Immutable.OrderedSet(),
  syncState: {
    text: 'unknown'
  }
}

export default function configureStore() {
  const db = new PouchDB('checklyst');
  window.db = db;

  const syncClient = PouchSync.createClient()

  const sync = syncClient.
    connect('ws://localhost:3001').
    on('error', function(err) {
      console.log('Error from PouchSync - ', err);
    }).
    sync(db, {
      remoteName: 'checklyst-server',
    })

  syncEvents.forEach(function(event) {
    sync.on(event, function() {
      store.dispatch({type: types.SET_SYNC_STATE, text: event});
    })
  })

  clientEvents.forEach(function(event) {
    syncClient.on(event, function() {
      store.dispatch({type: types.SET_SYNC_STATE, text: event});
    })
  })

  const pouchMiddleware = PouchMiddleware([
    {
      path: '/checklists',
      db,
      validate: (doc) => { return doc.type === 'checklists';},
      actions: {
        remove: doc => doc.type === 'checklists' && store.dispatch({type: types.DELETE_CHECKLIST, id: doc._id}),
        insert: doc => doc.type === 'checklists' && store.dispatch({type: types.INSERT_CHECKLIST, checklist: doc}),
        update: doc => doc.type === 'checklists' && store.dispatch({type: types.INSERT_CHECKLIST, checklist: doc})
      }
    },
    {
      path: '/projects',
      db,
      validate: (doc) => {return doc.type === 'projects';},
      actions: {
        remove: doc => doc.type === 'projects' && store.dispatch({type: types.DELETE_PROJECT, id: doc._id}),
        insert: doc => doc.type === 'projects' && store.dispatch({type: types.INSERT_PROJECT, project: doc}),
        update: doc => doc.type === 'projects' && store.dispatch({type: types.UPDATE_PROJECT, project: doc})
      }
    },
  ])

  const createStoreWithMiddleware = applyMiddleware(pouchMiddleware)(createStore)
  // const store = (window.devToolsExtension ? window.devToolsExtension()(createStoreWithMiddleware) : createStoreWithMiddleware)(rootReducer, initialState)
  const store = createStoreWithMiddleware(rootReducer, initialState)

  if (module.hot) {
    // Enable Webpack hot module replacement for reducers
    module.hot.accept('../reducers', () => {
      const nextReducer = require('../reducers')
      store.replaceReducer(nextReducer)
    })
  }

  return store
}
