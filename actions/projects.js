import * as types from '../constants/ActionTypes'
import hoodie from '../store/hoodie'
import store from '../store/store'
import _ from 'lodash'

export function addProject(data) {
  hoodie.store.add('project', data)
  return { type: types.ADD_PROJECT, data }
}

export function insertProject(data) {
  return { type: types.INSERT_PROJECT, data }
}

export function findProject({projectId}) {
  hoodie.store.find('project', projectId).then((projectData) => {
    store.dispatch({ type: types.INSERT_PROJECT, project: projectData })
  });
  return { type: types.FIND_PROJECT }
}

export function findAllProjects() {
  hoodie.store.findAll('project').then((projectsData) => {
    _.each(projectsData, (projectData) => {
      store.dispatch({ type: types.INSERT_PROJECT, project: projectData })
    });
  });
  return { type: types.FIND_ALL_PROJECT }
}
