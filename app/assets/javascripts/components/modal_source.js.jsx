var ModalSource = React.createClass({
  getInitialState: function() {
    return {
      opened: false,
      submitted: false
    };
  },

  render: function(){

    var modalClasses = classNames({
      "modl-source": true,
      "modl": true,
      "active": this.state.opened,
      'is-submitted': this.state.submitted
    })

    var modalContentClasses = classNames({
      "modl-content": true,
      "pullUp": this.state.opened
    })

    btnValue = this.state.submitted ? "Thanks ! - Back to the site" : "Suggest a source"

    return(
      <div className="modal-component">
        <div className={modalClasses}  onClick={this.handleClick}>
          <div className={modalContentClasses}>
            <form className='formspree' data-remote='true' action="https://formspree.io/tchret@gmail.com" method="POST">
                <input autoComplete="off" className="input-twitter-username" ref='twitter' name='twitter_id' placeholder="ex: TechCrunch" onClick={this.stopPropagation} />
                <input type="hidden" name="_subject" value="New suggestion!" />
                <input type="hidden" name="_cc" value="edward.schults@gmail.com" />
                <input type="hidden" name="from" value={this.props.currentUser.twitter_id} />
            </form>
            <div className='text-center'>
              <a className='button' onClick={this.handleDispatch}>{btnValue}</a>
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

  componentDidMount: function() {
    var that = this
    PubSub.subscribe('displayModalSource', function() {
      that.setState({
        opened: true
      })
    })
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
      $.get(this.props.suggestionPath + '?twitter_id=' + this.props.currentUser.twitter_id + "&suggestion=" + this.refs.twitter.getDOMNode().value)
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


