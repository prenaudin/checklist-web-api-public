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

        <label className='checklists-new-label form-group'>
          <div className='form-title'>
            Title
          </div>
          <input
            className='checklists-new-input form-input form-input--lg'
            type='text'
            value={this.state.title}
            onChange={this.handleChangeTitle.bind(this)}
            placeholder='Awesome Checklist'
          />
        </label>

        {
          this.state.suite.map((test, i) => {
            return (
              <label key={test.key} className='checklists-new-label form-group'>
                <div className='form-title'>
                  Story #{i}
                </div>
                <input
                  className='checklists-new-input form-input form-input--md'
                  type='text'
                  value={test.title}
                  onChange={
                    (e) => {
                      this.handleChangeTestTitle(e, test.key)
                      (i === ( this.state.suite.size - 1 )) && this.handleChangeLastTest(e)
                    }
                  }
                  onFocus={
                    (e) => {
                      (i === ( this.state.suite.size - 1 )) && this.handleFocusLastTest(e)
                    }
                  }
                  placeholder='You can use markdown'
                />
              </label>
            );
          }).toArray()
        }

        <div className='checklists-new-actions form-actions'>
          <Link className='btn btn-default' to={`/projects/${projectId}/checklists`}>
            Cancel
          </Link>
          <a
            href='javascript:void'
            className='btn btn-primary'
            onClick={this.handleClickSave.bind(this)}
          >
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

  handleFocusLastTest(e) {
    if (e.target.value.length == 0) {
      return false
    }
    this.appendTest()
  }

  handleChangeLastTest(e) {
    if (e.target.value.length == 0) {
      return false
    }
    this.appendTest()
  }

  handleClickSave() {
    const data = {
      title: this.state.title,
      suite: this.state.suite.map((test) => {title: test.title}).toArray(),
      project: this.props.params.projectId,
    }
    this.props.actions.addChecklist(data);
  }

  appendTest() {
    const oldSuite = this.state.suite;
    const test = createTest()
    this.setState({
      suite: oldSuite.set(test.key, test)
    });
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
