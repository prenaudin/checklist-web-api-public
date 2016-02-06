import Immutable from 'immutable'
import {Promise} from 'es6-promise'
import _ from 'lodash'
import { normalize, Schema, arrayOf } from 'normalizr'

let accessToken = localStorage.getItem('checklyst:auth:accessToken')
let clientToken = localStorage.getItem('checklyst:auth:clientToken')
let uidToken = localStorage.getItem('checklyst:auth:uidToken')

const setTokens = function(tokens){
  accessToken = tokens.accessToken
  clientToken = tokens.clientToken
  uidToken = tokens.uidToken
  localStorage.setItem('checklyst:auth:accessToken', accessToken)
  localStorage.setItem('checklyst:auth:clientToken', clientToken)
  localStorage.setItem('checklyst:auth:uidToken', uidToken)
}

const send = function(method, url, body) {
  const headers = new Headers({
		'Content-Type': 'application/json',
    'client': clientToken,
    'access-token': accessToken,
    'uid': uidToken,
    'token-type': 'Bearer'
	})

  return window.fetch(url, {
    method: method,
    body: JSON.stringify(body),
    headers: headers
  }).then(function(response) {
    setTokens({
      accessToken: response.headers.get('access-token'),
      clientToken: response.headers.get('client'),
      uidToken: response.headers.get('uid')
    })
    return response.json()
  })
}

const ProjectSchema = new Schema('projects')
const UserSchema = new Schema('users')
const ChecklistSchema = new Schema('checklists')

const flattenObject = function(object) {
  const relationships = _.reduce(object.relationships, (result, value, key) => {
    if (_.isArray(value.data)) {
      result[key] = _.pluck(value.data, 'id')
    } else {
      result[key] = value.data.id
    }
    return result
  }, {})
  return _(object)
    .pick('id', 'type')
    .extend(object.attributes)
    .extend(relationships)
    .value()
}

const flattenObjects = function(objects) {
  if (!_.isArray(objects)) {
    objects = [objects]
  }
  return _.map(objects, flattenObject)
}

const flattenResponse = function(response) {
  let flatten = []
  flatten.push(flattenObjects(response.data))
  response.included && flatten.push(flattenObjects(response.included))

  const entities = _(flatten)
    .flatten()
    .groupBy((value) => { return value.type })
    .mapValues((value) => {
      return _.reduce(value, (result, v) => {
        result[v.id] = v
        return result
      }, {})
    })
    .value()

  const results = _(entities)
    .mapValues((value) => { return _.keys(value) })
    .value()

  return {results, entities}
}

const ServerAPI = {

  signin: ({data}) => {
    return send('post', '/api/auth/sign_in', data)
  },

  validateToken: () => {
    return send('get', '/api/auth/validate_token')
  },

  createProject: ({data}) => {
    return send('post', '/api/projects', {data}).then(flattenResponse)
  },

  findAllProjects: () => {
    return send('get', '/api/projects?include=checklists,user').then(flattenResponse)
  },

  findProject: (projectId) => {
    return send('get', `/api/projects/${projectId}?include=checklists,user`).then(flattenResponse)
  }

}

export default ServerAPI
