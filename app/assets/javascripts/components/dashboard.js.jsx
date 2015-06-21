var Dashboard = React.createClass({
  getInitialState: function() {
    return {
      modalOpened: false
    };
  },

  render: function() {
    var that = this
    var opened = this.state.modalOpened

    return(
      <div className='dashboard'>
        {this.props.sources.map(function (source) {
          return(<SourceTile source={source.infos} parent={this} isOn={source.isOn} follow_path={source.follow_path} toggleable={that.props.toggleable} stop_following_path={source.stop_following_path}/>)
        }, that)}
      </div>
    )
  },

  openModal: function(){
    this.setState({
      modalOpened: this.state.modalOpened? false : true
    })

  }
})