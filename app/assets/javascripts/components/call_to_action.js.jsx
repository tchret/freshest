var CallToAction = React.createClass({
  render: function(){
    return(
      <div className='button modalConnect' onClick={this.handleClick}>
        <span>
          Suggest a source
        </span>
      </div>
    )
  },

  handleClick: function(e) {
    e.preventDefault()
    if (this.props.userSignedIn) {
      PubSub.publish("displayModalSource")
    } else {
      PubSub.publish("displayModalConnect")
    }
  }
})