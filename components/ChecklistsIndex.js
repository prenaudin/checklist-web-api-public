import React from 'react';
import ChecklistsList from './ChecklistsList';
import ChecklistsHelpers from '../utils/ChecklistsHelpers';
import { connect } from 'react-redux'

class ChecklistsIndex extends React.Component {

  render() {
    const checklists = ChecklistsHelpers.getChecklistsByProject({
      checklists: this.props.checklists,
      projectId: this.props.params.projectId
    });

    return (
      <div className="checklists-index page">
        <ChecklistsList {...this.props} checklists={checklists}/>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    checklists: state.checklists,
  }
}

export default connect(mapStateToProps)(ChecklistsIndex)
