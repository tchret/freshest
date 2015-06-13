var ModalConnect = React.createClass({
  getInitialState: function() {
    return {
      opened: false,
      redirection: false
    };
  },

  render: function(){

    if (this.state.opened) {
      $('body').addClass('no-scroll')
    } else {
      $('body').removeClass('no-scroll')
    }

    var modalClasses = React.addons.classSet({
      "modl-connect": true,
      "modl": true,
      "active": this.state.opened
    })

    var modalContentClasses = React.addons.classSet({
      "modl-content": true,
      "pullUp": this.state.opened,
      "hidden": this.state.redirection
    })

    var redirectionClasses = React.addons.classSet({
      "hidden": !this.state.redirection
    })

    return(
      <div className="modal-component">
        <a className='button' onClick={this.handleClick}>
          <span>
            Suggest an influencer
          </span>
        </a>
        <div className={modalClasses} onClick={this.handleClick}>
          <div className={redirectionClasses}>
            You should have been prompted to sign in within a popup window.
          </div>
          <div className={modalContentClasses}>
            <ul className='influencers-avatar list-inline text-center'>
              { this.props.last_influencers_images.map(function(influencer_avatar) {
                return (
                  <li>
                    <img src={influencer_avatar} className='avatar' />
                  </li>
                  )
              }) }
            </ul>
            <h3 className='text-center'>
              Join the community today by adding your favorite influencer
            </h3>
            <div className='text-center'>
              <a className='button button-twitter' href={this.props.href} onClick={this.handleConnect}>
                <i className='fa fa-twitter'></i> Sign up with Twitter
              </a>
            </div>
          </div>
        </div>
      </div>
    )
  },

  handleConnect: function(){
    this.setState({
      redirection: true
    })
    e.stopPropagation();
    e.nativeEvent.stopImmediatePropagation();
  },

  handleClick: function(){
    this.setState({
      opened: this.state.opened? false : true
    })
  }
})