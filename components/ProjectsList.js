import React from 'react';
import { connect } from 'react-redux'
import { Link } from 'react-router';

class ProjectsList extends React.Component {
  render() {
    return (
      <ul className="projects-list">
        <li className='projects-list-item projects-list-item--new'>
          <Link
            to={`/projects/new`}
            className='projects-list-item-content'
          >
            <div className='projects-list-item-content-plus'>
              +
            </div>
            <div className='projects-list-item-content-text'>
              New Project
            </div>
          </Link>
        </li>
        {
          this.props.projects.map((project) => {
            return (
              <li key={project.get('_id')} className='projects-list-item'>
                <Link
                  to={`/projects/${project.get('_id')}/checklists`}
                  className='projects-list-item-content'
                >
                  <div className='projects-list-item-title'>
                    {project.get('title')}
                  </div>
                  <div className='projects-list-item-bottom'>
                    {project.get('checklists').size} checklists
                  </div>
                </Link>
              </li>
            );
          }).toArray()
        }
      </ul>
    );
  }
}

function mapStateToProps(state) {
  return {
    projects: state.projects
  }
}

export default connect(mapStateToProps)(ProjectsList)
