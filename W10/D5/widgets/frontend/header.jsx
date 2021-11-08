import React from 'react';

class Header extends React.Component {
  constructor(props){
    super(props);
  }

  render() {
    const headers = this.props.tabs.map((tab, idx) => {
      let title = tab.title;
      return (
        <li key={idx} className={tab} 
          onClick={() => this.props.switchTab(idx)}>
          {title}
        </li>
      );
    })

    return (
      <ul className='tab-header'>
        {headers}
      </ul>
    )
  }
}

export default Header;