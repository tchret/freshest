var OverlayTrigger = ReactBootstrap.OverlayTrigger;
var Popover = ReactBootstrap.Popover

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
        <OverlayTrigger trigger='click' placement='bottom' overlay={
          <Popover className="popover-source">
            <PopoverContent dataSourcePath={this.props.dataSourcePath} />
          </Popover>
        }>
          <img src={source.avatar_url} className='shadowed' id={"source_" + source.id} />
        </OverlayTrigger>

          <menu className={toggleMenuClasses} onClick={this.handleClick} onTouch={this.handleClick} type="toolbar">
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
      PubSub.publish("displayModalConnect")
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