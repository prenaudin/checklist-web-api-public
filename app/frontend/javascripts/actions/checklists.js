import * as types from '../constants/ActionTypes'
import api from '../api/api'

export function addChecklist(data) {
  return (dispatch, getState) => {
    return api.createChecklist({data}).then((resp) => {
      dispatch({ type: types.RECEIVED_ENTITIES, entities: resp.entities })
    })
  }
}

export function findChecklist({projectId, checklistId}) {
  return (dispatch, getState) => {
    return api.findChecklist({projectId, checklistId}).then((resp) => {
      dispatch({ type: types.RECEIVED_ENTITIES, entities: resp.entities })
    })
  }
}

export function deleteChecklist({projectId, checklistId}) {
  return (dispatch, getState) => {
    return api.deleteChecklist({projectId, checklistId}).then((resp) => {
      dispatch({ type: types.DELETE_CHECKLIST_SUCCESS, projectId, checklistId })
    })
  }
}
