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
            <form className='formspree' data-remote='true' action="https://formspree.io/tchret@gmail.com" method="POST">
                <input autoComplete="off" className="input-twitter-username" ref='twitter' name='twitter_id' placeholder="twitter_username" onClick={this.stopPropagation} />
                <input type="hidden" name="_subject" value="New suggestion!" />
                <input type="hidden" name="_cc" value="edward.schults@gmail.com" />
                <input type="hidden" name="from" value={this.props.currentUser.twitter_id} />

            </form>
            <div className='text-center'>
              <a className='button button-influencer-modal' onClick={this.handleDispatch}>SUGGEST</a>
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

  handleDispatch: function(e) {
    $('.formspree').submit()
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


