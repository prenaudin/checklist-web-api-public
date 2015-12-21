import React, { Component, PropTypes } from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Immutable from 'immutable'
import Header from '../components/Header'
import Footer from '../components/Footer'
import * as ProjectActions from '../actions/projects'
import * as ChecklistActions from '../actions/checklists'

require('../styles/App.sass');
require('../styles/Checklists.sass');
require('../styles/Header.sass');
require('../styles/Home.sass');
require('../styles/Projects.sass');

class App extends Component {
  render() {
    const { projects, actions, syncState } = this.props
    return (
      <div className="app">
        {this.props.header || <Header/>}
        {this.props.content || this.props.children}
        <Footer status={syncState}/>
      </div>
    )
  }
}

App.propTypes = {
  projects: PropTypes.instanceOf(Immutable.Map).isRequired,
  actions: PropTypes.object.isRequired
}

function mapStateToProps(state) {
  return {
    projects: state.projects,
    checklists: state.checklists,
    syncState: state.syncState,
  }
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(ProjectActions, ChecklistActions, dispatch)
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(App)
