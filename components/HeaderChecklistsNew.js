import React from 'react';
import {Link} from 'react-router';

class HeaderChecklistsNew extends React.Component {
  render() {
    const projectId = this.props.params.projectId;

    return (
      <div className="header header--checklists-index">
        <div className="header-title">
          <Link to={`/projects/${projectId}/checklists`}>
            {'←  '}
          </Link>
          New Checklist
        </div>
        <div className="header-infos">
        </div>
      </div>
    );
  }
}

export default HeaderChecklistsNew;
