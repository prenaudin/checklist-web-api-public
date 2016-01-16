import { INSERT_PROJECT, UPDATE_PROJECT } from '../constants/ActionTypes'
import Immutable from 'immutable'

const initialState  = new Immutable.Map()

const ProjectRecord = Immutable.Record({
  id: null,
  type: 'project',
  title: '',
  createdAt: null,
  createdBy: null,
  updatedAt: null,
  checklists: new Immutable.OrderedSet()
})

export default function projects(state = initialState, action) {
  let id;
  switch (action.type) {

    case INSERT_PROJECT:
      id = action.project.id
      return state.set(id, new ProjectRecord().merge(Immutable.fromJS(action.project)))

    case UPDATE_PROJECT:
      id = action.project.id
      return state.set(id, state.get(id).merge(Immutable.fromJS(action.project)))

    default:
      return state
  }
}
