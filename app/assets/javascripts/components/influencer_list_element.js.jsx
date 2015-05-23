InfluencerListElement = React.createClass({
  render: function () {
    return(
      <div className='infuencer'>
        <div className="pull-left">
          <img src={this.props.influencer.avtar_url} className='avatar' />
        </div>
        <div className="pull-left">
          <a data-remote='true' onClick={this.handleClick} >
            {this.props.influencer.name}
          </a>
        </div>
        <div className='time pull-right'>
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
        that.props.parentComponent.displayPost(data)
      }
    })
  }
})

