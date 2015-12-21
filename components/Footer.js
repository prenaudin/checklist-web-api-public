import SyncStatus from './SyncStatus'
import React from 'react';

class Footer extends React.Component {
  render() {
    return (
      <footer className="footer">
        {'Made with <3 by muxumuxu'}

        <SyncStatus status={this.props.status}/>
      </footer>
    );
  }
}

export default Footer;
