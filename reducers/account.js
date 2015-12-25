import { UPDATE_ACCOUNT } from '../constants/ActionTypes'
import Immutable from 'immutable'

const AccountRecord = Immutable.Record({
  id: null,
  username: null,
  isSignedIn: false
})

const initialState = new AccountRecord()

export default function account(state = initialState, action) {
  let id;
  switch (action.type) {

    case UPDATE_ACCOUNT:
      return state

    default:
      return state
  }
}
