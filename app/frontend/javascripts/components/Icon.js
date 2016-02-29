import React from 'react';

class Icon extends React.Component {

  render() {
    const iconId = this.props.id ? 'icon-' + this.props.id : this.props.iconId;
    return (
      <svg
        className='icon'
        dangerouslySetInnerHTML={{__html: '<use xlink:href="/assets/icons.svg#' + iconId + '"/>'}}
      />
    );
  }

}

export default Icon;
