import React from 'react';
import Header from './header';


class Tabs extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      selectedIndex: 0
    }
    this.switchTab = this.switchTab.bind(this);
  }

  switchTab(idx){
    this.setState({selectedIndex: idx})
  }

  render(){
    const tab = this.props.tabs[this.state.selectedIndex];
    return (
      <div className="tabs">
        <h1>Tabs</h1>
        <div className="tabs">
          <Header selectedIndex={this.state.selectedIndex} 
          switchTab={this.switchTab}
          tabs={this.props.tabs}>
          </Header>
          <div className="content">
            <article>
              {tab.content}
            </article>
          </div>
        </div>
      </div>
    )
  }
}



export default Tabs; 