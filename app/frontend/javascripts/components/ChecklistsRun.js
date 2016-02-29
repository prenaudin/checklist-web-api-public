import React from 'react';
import _ from 'lodash';
import Immutable from 'immutable';
import {Link} from 'react-router';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as ChecklistActions from '../actions/checklists';

const TestRecord = Immutable.Record({
  id: null,
  title: '',
  comment: '',
  status: 'pending',
})

const createTest = (params = {}) => {
  console.log(params);
  const testData = Object.assign({}, { id: _.uniqueId() }, params)
  return new TestRecord(testData)
}

const serializeTests = (tests) => {
  return tests
}

const initTests = (testSuite) => {
  console.log('initTests', testSuite);
  return _.reduce(testSuite, (memo, test) => {
    const newTest = createTest(test)
    return memo.set(newTest.id, newTest)
  }, new Immutable.Map())
}

class ChecklistsRunTestsItem extends React.Component {

  render() {
    return (
      <label className='checklists-run-label form-group'>
        <div className='form-title'>
          {this.props.test.title} - {this.props.test.status}
        </div>
        <input
          className='checklists-run-input form-input form-input--md'
          type='text'
          value={this.props.test.comment}
          onChange={this.handleChange.bind(this)}
        />
      </label>
    );
  }

  handleChange(e) {
    this.props.onChangeTestComment(e, this.props.test.id)
  }
}

class ChecklistsRun extends React.Component {

  constructor() {
    super();

    this.state = {
      title: '',
      tests: new Immutable.Map()
    };
  }

  componentDidMount() {
    const {checklistId, projectId} = this.props.params
    this.props.actions.findChecklist({checklistId, projectId})
  }

  componentWillReceiveProps(nextProps) {
    const {checklistId} = nextProps.params
    const checklist = nextProps.checklists.get(checklistId)
    if (checklist && this.state.tests.size === 0) {
      this.setState({
        title: 'v' + (checklist.get('versions').size + 1),
        tests: initTests(checklist.get('testSuite').toJS())
      })
    }
  }

  render() {
    const {projectId, checklistId} = this.props.params
    const project = this.props.projects.get(projectId)
    const checklist = this.props.checklists.get(checklistId)
    let testIndex = 0

    if (!checklist) {
      return false
    }

    return (
      <div className='checklists-run'>

        <label className='checklists-run-label form-group'>
          <div className='form-title'>
            {checklist.get('title')} -
            {this.state.title}
          </div>
        </label>

        {
          this.state.tests.map(((test) => {
            testIndex++
            return (
              <ChecklistsRunTestsItem
                key={test.id}
                index={testIndex}
                test={test}
                onChangeTestComment={this.handleChangeTestComment.bind(this)}
              />
            );
          }).bind(this)).toArray()
        }

        <div className='form-footer-container'>
          <div className='form-footer clearfix'>
            <div className='form-resume'>
              <div className='form-resume-count'>
                {serializeTests(this.state.tests).size}
              </div>
              <div className='form-resume-subtitle'>
                Tests
              </div>
            </div>

            <div className='checklists-run-actions form-actions'>
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
        </div>
      </div>
    );
  }

  handleChangeTitle(e) {
    this.setState({title: e.target.value});
  }

  handleChangeTestComment(e, id) {
    const newComment = e.target.value;
    const oldTests = this.state.tests;
    this.setState({
      tests: oldTests.set(id, oldSuite.get(id).set('comment', newComment))
    });
  }

  handleClickSave() {
    const projectId = this.props.params.projectId
    const data = {
      title: this.state.title,
      testSuite: serializeTestSuite(this.state.testSuite).map((test) => {
        return {title: test.title}
      }).toArray(),
      project: projectId,
    }
    this.props.actions.addChecklist(data);
    this.props.history.pushState(null, `/projects/${projectId}/checklists`);
  }

}

ChecklistsRun.propTypes = {
  actions: React.PropTypes.object.isRequired
}

function mapStateToProps(state, ownProps) {
  return {
    checklists: state.checklists,
    projects: state.projects
  }
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(ChecklistActions, dispatch)
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ChecklistsRun)
