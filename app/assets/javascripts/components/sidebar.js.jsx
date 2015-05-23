var Sidebar = React.createClass({
  render: function (){
    return (
      <div className='sidebar'>
        {this.props.influencers.map(function (influencer) {
            return (
              <InfluencerListElement href={'/meta?href=' + influencer.href} parentComponent={this} influencer={influencer} />
            )
        }, this.props.layout)}
      </div>
    )
  }
})