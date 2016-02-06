import { SIGNIN } from '../constants/ActionTypes'
import Immutable from 'immutable'

const AccountRecord = Immutable.Record({
  id: null,
  email: null,
  isSignedIn: false
})

const initialState = new AccountRecord()

export default function account(state = initialState, action) {

  switch (action.type) {

    case SIGNIN:
      return state
        .set('id', action.data.id)
        .set('email', action.data.email)
        .set('isSignedIn', true)

    default:
      return state

  }
}
