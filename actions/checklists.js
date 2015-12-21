import * as types from '../constants/ActionTypes'

export function addChecklist(data) {
  return { type: types.ADD_CHECKLIST, data }
}
