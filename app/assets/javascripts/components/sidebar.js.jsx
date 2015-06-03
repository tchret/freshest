var Sidebar = React.createClass({
  render: function (){
    return (
      <div className='sidebar'>
        {this.props.influencers.map(function (influencer) {
            return (
              <InfluencerListElement href={'/meta?twitter_id=' + influencer.twitter_id} parentComponent={this} influencer={influencer} />
            )
        }, this.props.layout)}
        <div className='clear'/>
      </div>
    )
  }
})