import React from 'react';
import {Link} from 'react-router';
import ChecklistsHelpers from '../utils/ChecklistsHelpers';

class ChecklistsList extends React.Component {
  render() {
    return (
      <ul className="checklists-list">
        <li className='checklists-list-item checklists-list-item--new'>
          <Link
            to={`/projects/${this.props.params.projectId}/checklists/new`}
            className='checklists-list-item-content--new'
          >
            <div className='checklists-list-item-content-text'>
              New Checklist
            </div>
          </Link>
        </li>
        {
          this.props.checklists.map((checklist) => {
            return (
              <li key={checklist.get('id')} className='checklists-list-item projects-list-item--show'>
                <div className='checklists-list-item--default'>
                  {checklist.get('title')}
                  <div className='checklists-list-item-counters'>
                    <div className='checklists-list-item-counters-item'>
                      <div className='checklists-list-item-counters-item-count'>
                        {ChecklistsHelpers.getTestsOKCount(checklist)}
                      </div>
                      <div className='checklists-list-item-counters-item-label'>
                        OK
                      </div>
                    </div>
                    <div className='checklists-list-item-counters-item'>
                      <div className='checklists-list-item-counters-item-count'>
                        {ChecklistsHelpers.getTestsNOKCount(checklist)}
                      </div>
                      <div className='checklists-list-item-counters-item-label'>
                        NOK
                      </div>
                    </div>
                    <div className='checklists-list-item-counters-item'>
                      <div className='checklists-list-item-counters-item-count'>
                        {ChecklistsHelpers.getTestsPendingCount(checklist)}
                      </div>
                      <div className='checklists-list-item-counters-item-label'>
                        PENDING
                      </div>
                    </div>
                  </div>
                </div>
                <div className='checklists-list-item--hover'>
                  <div className='checklists-list-item-actions-secondary'>
                    <Link to={`/projects/${checklist.get('project')}/checklists/${checklist.get('id')}/share`}>S</Link>
                    <Link to={`/projects/${checklist.get('project')}/checklists/${checklist.get('id')}/edit`}>E</Link>
                    <Link to={`/projects/${checklist.get('project')}/checklists/${checklist.get('id')}/history`}>H</Link>
                    <Link to={`/projects/${checklist.get('project')}/checklists/${checklist.get('id')}/duplicate`}>D</Link>
                  </div>

                  <div className='checklists-list-item-actions-run'>
                    <Link to={`/projects/${checklist.get('project')}/checklists/${checklist.get('id')}/run`}>New Test</Link>
                  </div>
                </div>
              </li>
            );
          }).toArray()
        }
      </ul>
    );
  }
}

export default ChecklistsList;
