import { ADD_PROJECT, INSERT_PROJECT, UPDATE_PROJECT } from '../constants/ActionTypes'
import Immutable from 'immutable'

const initialState  = new Immutable.Map()

const ProjectRecord = Immutable.Record({
  _id: null,
  _rev: null,
  type: 'projects',
  title: '',
  users: new Immutable.Set(),
  checklists: new Immutable.Set()
})

export default function projects(state = initialState, action) {
  let id;
  switch (action.type) {
    case ADD_PROJECT:
      id = generateId()
      return state.set(id, new ProjectRecord({
        _id: id,
        title: action.data.title
      }))

    case INSERT_PROJECT:
      id = action.project._id
      return state.set(id, new ProjectRecord().merge(Immutable.fromJS(action.project)))

    case UPDATE_PROJECT:
      id = action.project._id
      return state.set(id, state.get(id).merge(Immutable.fromJS(action.project)))

    default:
      return state
  }
}

function generateId() {
  return Math.random().toString(36).substring(7);
}
