var ModalConnect = React.createClass({
  getInitialState: function() {
    return {
      opened: this.props.opened,
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
        <div className={modalClasses} onClick={this.handleClose}>
          <div className={redirectionClasses}>
            You should have been prompted to sign in within a popup window.
          </div>
          <div className={modalContentClasses}>
            <ul className='sources-avatar list-inline text-center'>
              { this.props.last_sources_images.map(function(source_avatar) {
                return (
                  <li>
                    <img src={source_avatar} className='avatar' />
                  </li>
                  )
              }) }
            </ul>
            <h3 className='text-center text-todothat'>
              Join the community today by adding your favorite source
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

  handleConnect: function() {
    this.setState({
      redirection: true
    })
    e.stopPropagation();
    e.nativeEvent.stopImmediatePropagation();
  },

  componentWillReceiveProps: function(nextProps) {
    this.setState({
      opened: nextProps.opened
    })
  },

  componentDidMount: function() {
    var that = this
    PubSub.subscribe('displayModalConnect', function(){
      that.setState({
        opened: true
      })
    })
  },


  handleClose: function(){
    this.setState({
      opened: false
    })
  }
})