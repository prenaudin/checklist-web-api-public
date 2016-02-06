import * as types from '../constants/ActionTypes'
import store from '../store/store'
import api from '../api/api'
import _ from 'lodash'

export function addProject(data) {
  return (dispatch, getState) => {
    return api.createProject({data}).then((resp) => {
      dispatch({ type: types.RECEIVED_ENTITIES, entities: resp.entities })
    })
  }
}

export function insertProject(data) {
  return { type: types.INSERT_PROJECT, data }
}

export function findProject({projectId}) {
  return (dispatch, getState) => {
    return api.findProject(projectId).then((resp) => {
      dispatch({ type: types.RECEIVED_ENTITIES, entities: resp.entities })
    })
  }
}

export function findAllProjects() {
  return (dispatch, getState) => {
    return api.findAllProjects().then((resp) => {
      dispatch({ type: types.RECEIVED_ENTITIES, entities: resp.entities })
    })
  }
}
