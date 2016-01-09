import * as types from '../constants/ActionTypes'

export function addChecklist(data) {
  hoodie.store.add('checklist', data)
  return { type: types.ADD_CHECKLIST, data }
}
