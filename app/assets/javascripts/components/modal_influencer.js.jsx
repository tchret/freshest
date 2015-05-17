var ModalInfluencer = React.createClass({
  getInitialState: function() {
    return {
      opened: false
    };
  },

  render: function(){

    var modalClasses = React.addons.classSet({
      "modl-influencer": true,
      "modl": true,
      "active": this.state.opened
    })

    var modalContentClasses = React.addons.classSet({
      "modl-content": true,
      "pullUp": this.state.opened
    })

    return(
      <div className="modal-component">
        <a className='button' onClick={this.handleClick}>
          <span>
            Suggest an influencer
          </span>
        </a>
        <div className={modalClasses}  onClick={this.handleClick}>
          <div className={modalContentClasses}>
            <input className="input-twitter-username" ref='twitter' placeholder="twitter_username" onClick={this.stopPropagation} />
            <div className='text-center'>
              <a className='button button-influencer-modal'>SUGGEST</a>
            </div>
          </div>
        </div>
      </div>
    )
  },

  stopPropagation: function(e){
     e.stopPropagation();
     e.nativeEvent.stopImmediatePropagation();
  },

  handleClick: function(){
    this.setState({
      opened: this.state.opened? false : true
    })

    if (!this.state.opened) {
      this.refs.twitter.getDOMNode().focus();
    }

  }
})


