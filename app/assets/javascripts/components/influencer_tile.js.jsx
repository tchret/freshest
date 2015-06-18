var InfluencerTile = React.createClass({
  getInitialState: function() {
    return {
      isOn: this.props.isOn
    };
  },

  render: function() {
    var influencer = this.props.influencer
    tileClasses = React.addons.classSet({
      "influencer-tile": true,
      "is-off": !this.state.isOn
    })
    toggleMenuClasses = React.addons.classSet({
      "influencer-tile-menu": true,
      "is-on": this.state.isOn,
      "is-off": !this.state.isOn
    })
    return (
      <div className={tileClasses}>
        <img src={influencer.avatar_url} />
        <menu className={toggleMenuClasses} onClick={this.handleClick} type="toolbar">
          <div className="toggle-switch"></div>
          <div className="label-container">
            <label className='label-on'>on</label>
            <label className='label-off'>off</label>
          </div>
        </menu>
      </div>
    )
  },

  handleClick: function(){
    if(this.props.toggleable) {
      this.setState({
        isOn: !this.state.isOn
      })
      if(!this.state.isOn){
        $.get( this.props.follow_path, function( data ) {
        });
      } else {
        $.get( this.props.stop_following_path, function( data ) {
        });
      }
    }
  }
})