import { RECEIVED_ENTITIES } from '../constants/ActionTypes'
import Immutable from 'immutable'

const initialState  = new Immutable.Map()

const ChecklistRecord = Immutable.Record({
  id: null,
  createdAt: null,
  updatedAt: null,
  type: 'checklists',
  title: '',
  project: null,
  testSuite: {}
})

const mergeChecklists = (state, checklists) => {
  return state.merge(checklists.map((checklist) => {
    return new ChecklistRecord(checklist)
  }))
}

export default function checklists(state = initialState, action) {
  switch (action.type) {
    case RECEIVED_ENTITIES:
      if (!action.entities.checklists) { return state }
      return mergeChecklists(state, Immutable.fromJS(action.entities.checklists))

    default:
      return state
  }
}
