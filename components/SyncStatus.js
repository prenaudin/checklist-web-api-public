import React, { PropTypes, Component } from 'react'
import classnames from 'classnames'

class SyncStatus extends Component {

  render() {
    const { text } = this.props.status
    return (
      <span>
        {' • '} syncStatus: {text}
      </span>
    )
  }
}

export default SyncStatus
