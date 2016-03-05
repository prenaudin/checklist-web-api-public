import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import App from './containers/App'
import Router from './components/Router'
import store from './store/store'

render(
  <Provider store={store}>
    <Router/>
  </Provider>,
  document.getElementById('app-container')
)