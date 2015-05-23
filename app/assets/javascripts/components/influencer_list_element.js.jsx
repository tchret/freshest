InfluencerListElement = React.createClass({
  render: function () {
    return(
      <div className='infuencer'>
        <div className="pull-left">
          <img src={this.props.influencer.user_image} className='avatar' />
        </div>
        <div className="pull-left">
          <a data-remote='true' onClick={this.handleClick} >
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

  handleClick: function(){
    var that = this;
    $.ajax({
      type: 'GET',
      url: this.props.href,
      success: function(data) {
        that.props.parentSidebar.handlePostChange();
      }
    })
  }
})

