import * as types from '../constants/ActionTypes'

export function addProject(data) {
  return { type: types.ADD_PROJECT, data }
}
