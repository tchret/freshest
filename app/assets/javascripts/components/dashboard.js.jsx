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
        {this.props.influencers.map(function (influencer) {
          return(<InfluencerTile influencer={influencer.infos} parent={this} isOn={influencer.isOn} follow_path={influencer.follow_path} toggleable={that.props.toggleable} stop_following_path={influencer.stop_following_path}/>)
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