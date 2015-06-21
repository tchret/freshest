var SourceTile = React.createClass({
  getInitialState: function() {
    return {
      isOn: this.props.isOn
    };
  },

  render: function() {
    var source = this.props.source
    tileClasses = React.addons.classSet({
      "source-tile": true,
      "is-off": !this.state.isOn
    })
    toggleMenuClasses = React.addons.classSet({
      "source-tile-menu": true,
      "is-on": this.state.isOn,
      "is-off": !this.state.isOn
    })
    return (
      <div className='source-tile-container'>
        <div className={tileClasses}>
          <img src={source.avatar_url} className='shadowed' />
          <menu className={toggleMenuClasses} onClick={this.handleClick} type="toolbar">
            <div className="toggle-switch"></div>
            <div className="label-container">
              <label className='label-on'>on</label>
              <label className='label-off'>off</label>
            </div>
          </menu>
        </div>
      </div>
    )
  },

  handleClick: function(){
    if(!this.props.toggleable) {
      $('.modl').addClass('active')
      $('.modl-content').addClass('pullUp')
      $('.text-todothat').text("Join the community today to manage your sources")
    } else {
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