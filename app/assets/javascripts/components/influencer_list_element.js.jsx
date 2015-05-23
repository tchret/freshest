var InfluencerListElement = React.createClass({
  // getInitialState: function() {

  // },

  render: function() {
    return(
      <div className='influencer'>
        <div className="pull-left">
          <img src={this.props.influencer.user_image} className='avatar' />
        </div>
        <div className="pull-left">
          <a onClick={this.handleClick} data-remote='true'>
            {this.props.influencer.user_name}
          </a>
        </div>
        <div className='time pull-right'>
          {this.props.influencer.created_at} ago
        </div>
        <div className='clear'></div>
      </div>
    )
  },

  handleClick: function() {
    $.ajax({
      type: 'GET',
      url: this.props.href,
      success: function(data) {
        console.log(data)
      }
    });
  }
})