var ModalInfluencer = React.createClass({
  getInitialState: function() {
    return {
      opened: false,
      submitted: false
    };
  },

  render: function(){

    var modalClasses = React.addons.classSet({
      "modl-influencer": true,
      "modl": true,
      "active": this.state.opened,
      'is-submitted': this.state.submitted
    })

    var modalContentClasses = React.addons.classSet({
      "modl-content": true,
      "pullUp": this.state.opened
    })

    btnValue = this.state.submitted ? "THANKS FOR THE SUGGESTION - BACK TO THE SITE" : "SUGGEST THE INFLUENCER"

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
                <input type="hidden" name="_cc" value="tonmail@gmail.com" />
                <input type="hidden" name="from" value={this.props.currentUser.twitter_id} />

            </form>
            <div className='text-center'>
              <a className='button button-influencer-modal' onClick={this.handleDispatch}>{btnValue}</a>
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
    if (this.refs.twitter.getDOMNode().value == "") {

    } else if (this.state.submitted) {
      this.setState({
        opened: false,
        submitted: false
      })
      $('.input-twitter-username')[0].disabled = false
      $('.input-twitter-username').val('')
    } else {
      $('.formspree').submit()
      this.setState({
        submitted: true
      })
      $('.input-twitter-username')[0].disabled = true
    }
    e.stopPropagation();
    e.nativeEvent.stopImmediatePropagation();
  },

  handleClick: function(){
    this.setState({
      opened: this.state.opened? false : true
    })

    if (!this.state.opened) {
      this.refs.twitter.getDOMNode().focus();
      $('body').addClass('no-scroll')
    } else {
      $('body').removeClass('no-scroll')
    }

  }
})


