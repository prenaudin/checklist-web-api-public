import React from 'react';
import {Link} from 'react-router';

class HeaderChecklistsIndex extends React.Component {
  render() {
    const projectTitle = 'Project';

    return (
      <div className="header header--checklists-index">
        <div className="header-title">
          <Link to='/projects'>
            {'←  '}
          </Link>
          Checklyst / {projectTitle}
        </div>
        <div className="header-infos">
          luc@azendoo.com
        </div>
      </div>
    );
  }
}

export default HeaderChecklistsIndex;
