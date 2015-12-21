import { combineReducers } from 'redux'
import projects from './projects'
import checklists from './checklists'
import syncState from './syncState'

export default combineReducers({
  projects, checklists, syncState
})
