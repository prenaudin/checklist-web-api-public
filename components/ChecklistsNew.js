import React from 'react';
import _ from 'lodash';
import Immutable from 'immutable';
import {Link} from 'react-router';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as ChecklistActions from '../actions/checklists';

const TestRecord = Immutable.Record({
  key: null,
  title: '',
})

const createTest = () => {
  return new TestRecord({ key: _.uniqueId() })
}

class ChecklistsNew extends React.Component {

  constructor() {
    super();
    const test = createTest();

    this.state = {
      title: '',
      suite: new Immutable.Map().set(test.key, test)
    };
  }

  render() {
    const projectId = this.props.params.projectId;

    return (
      <div className='checklists-new'>

        <label className='checklists-new-label'>
          Title
          <input
            className='checklists-new-input'
            type='text'
            value={this.state.title}
            onChange={this.handleChangeTitle.bind(this)}
          />
        </label>

        {
          this.state.suite.map((test, i) => {
            return (
              <label key={test.key} className='checklists-new-label'>
                Story #{i}
                <input
                  className='checklists-new-input'
                  type='text'
                  value={test.title}
                  onChange={(e) => this.handleChangeTestTitle(e, test.key)}
                />
              </label>
            );
          }).toArray()
        }

        <button
          className='checklists-new-button'
          onClick={this.handleClickAddStory.bind(this)}
        >
          Add Story
        </button>

        <div className='checklists-new-actions'>
          <Link to={`/projects/${projectId}/checklists`}>
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

  handleChangeTestTitle(e, key) {
    const newTitle = e.target.value;
    const oldSuite = this.state.suite;
    this.setState({
      suite: oldSuite.set(key, oldSuite.get(key).set('title', newTitle))
    });
  }

  handleClickAddStory() {
    const oldSuite = this.state.suite;
    const test = createTest()
    this.setState({
      suite: oldSuite.set(test.key, test)
    });
  }

  handleClickSave() {
    const data = {
      title: this.state.title,
      suite: this.state.suite.map((test) => {title: test.title}).toArray(),
      project: this.props.params.projectId,
    }
    this.props.actions.addChecklist(data);
  }
}

ChecklistsNew.propTypes = {
  actions: React.PropTypes.object.isRequired
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(ChecklistActions, dispatch)
  }
}

export default connect(
  null,
  mapDispatchToProps
)(ChecklistsNew)
