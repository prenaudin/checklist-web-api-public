import React from 'react';
import {Link} from 'react-router';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as ProjectActions from '../actions/projects';

class ProjectsNew extends React.Component {

  constructor() {
    super();

    this.state = {
      title: '',
    };
  }

  render() {
    return (
      <div className='projects-new'>

        <label className='projects-new-label'>
          Title
          <input
            className='projects-new-input'
            type='text'
            value={this.state.title}
            onChange={this.handleChangeTitle.bind(this)}
          />
        </label>

        <div className='projects-new-actions'>
          <Link to={`/projects`}>
            Cancel
          </Link>
          {' - '}
          <a href='javascript:void' onClick={this.handleClickSave.bind(this)}>
            Save
          </a>
        </div>
      </div>
    );
  }

  handleChangeTitle(e) {
    this.setState({title: e.target.value});
  }

  handleClickSave() {
    const data = {
      title: this.state.title,
    }
    this.props.actions.addProject(data);
  }
}

ProjectsNew.propTypes = {
  actions: React.PropTypes.object.isRequired
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(ProjectActions, dispatch)
  }
}

export default connect(
  null,
  mapDispatchToProps
)(ProjectsNew)
