import React from 'react';
import {Link} from 'react-router';
import AuthSignin from './AuthSignin';

class Home extends React.Component {
  render() {
    return (
      <div className="home page">
        <h1>
          Checklyst
        </h1>
        <h3>
          Checklist for a safer future
        </h3>

        <p>
          <Link to="/projects">
            My Projects
          </Link>
        </p>

        <AuthSignin/>
      </div>
    );
  }
}

export default Home;
