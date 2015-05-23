var ModalConnect = React.createClass({
  getInitialState: function() {
    return {
      opened: false
    };
  },

  render: function(){

    var modalClasses = React.addons.classSet({
      "modl-connect": true,
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
        <div className={modalClasses} onClick={this.handleClick}>
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
              <a className='button button-twitter' href={this.props.href}>
                <i className='fa fa-twitter'></i> Sign up with Twitter
              </a>
            </div>
          </div>
        </div>
      </div>
    )
  },

  handleClick: function(){
    this.setState({
      opened: this.state.opened? false : true
    })
  }
})