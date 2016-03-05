import React, { Component } from 'react';
import history from './history';
import {Router, Route, Redirect} from 'react-router';
import App from '../containers/App';
import Home from './Home';
import ProjectsIndex from './ProjectsIndex';

import ProjectsNew from './ProjectsNew';
import HeaderProjectsNew from './HeaderProjectsNew';

import ChecklistsIndex from './ChecklistsIndex';
import HeaderChecklistsIndex from './HeaderChecklistsIndex';

import ChecklistsNew from './ChecklistsNew';
import HeaderChecklistsNew from './HeaderChecklistsNew';

import ChecklistsRun from './ChecklistsRun';
import HeaderChecklistsRun from './HeaderChecklistsRun';

import ProjectsEdit from './ProjectsEdit';

class AppRouter extends Component {
  render() {
    return (
      <Router history={history}>
        <Route component={App}>
          <Route path="home" component={Home}/>
          <Route path="projects" component={ProjectsIndex}/>
          <Route
            path="projects/new"
            components={{ content: ProjectsNew, header: HeaderProjectsNew }}
          />
          <Route
            path="projects/:projectId/checklists"
            components={{ content: ChecklistsIndex, header: HeaderChecklistsIndex }}
          />
          <Route
            path="projects/:projectId/checklists/new"
            components={{ content: ChecklistsNew, header: HeaderChecklistsNew }}
          />
          <Route
            path="projects/:projectId/checklists/:checklistId/run"
            components={{ content: ChecklistsRun, header: HeaderChecklistsRun }}
          />
          <Route path="projects/:projectId/edit" component={ProjectsEdit}/>
          <Redirect from='/' to='/home'/>
        </Route>
      </Router>
    );
  }
}

export default AppRouter;