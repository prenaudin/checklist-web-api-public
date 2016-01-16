import * as types from '../constants/ActionTypes'
import store from '../store/store'
import api from '../api/api'
import _ from 'lodash'

export function addProject(data) {
  return (dispatch, getState) => {
    return api.createProject({data}).then((resp) => {
      dispatch({ type: types.INSERT_PROJECT, project: resp.data })
    })
  }
}

export function insertProject(data) {
  return { type: types.INSERT_PROJECT, data }
}

export function findProject({projectId}) {
  return { type: types.FIND_PROJECT }
}

export function findAllProjects() {
  return (dispatch, getState) => {
    return api.findAllProjects().then((resp) => {
      _.each(resp.data, (projectData) => {
        dispatch({ type: types.INSERT_PROJECT, project: projectData })
      })
    })
  }
}
