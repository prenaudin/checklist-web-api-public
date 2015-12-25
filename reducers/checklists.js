import { ADD_CHECKLIST, INSERT_CHECKLIST} from '../constants/ActionTypes'
import Immutable from 'immutable'

const initialState  = new Immutable.OrderedSet()
const ChecklistRecord = Immutable.Record({
  id: null,
  _rev: null,
  type: 'checklist',
  title: '',
  project: '',
  suite: new Immutable.OrderedSet()
})

export default function checklists(state = initialState, action) {
  switch (action.type) {
    case ADD_CHECKLIST:
      return state.add(new ChecklistRecord({
        id: id(),
        title: action.data.title,
        suite: action.data.suite,
        project: action.data.project
      }))

    case INSERT_CHECKLIST:
      return state.add(new ChecklistRecord(action.checklist))

    default:
      return state
  }
}

function id() {
  return Math.random().toString(36).substring(7);
}
