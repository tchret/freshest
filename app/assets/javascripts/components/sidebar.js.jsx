var Sidebar = React.createClass({
  // getInitialState: function() {

  // },

  render: function() {
    return(
      <div className='sidebar'>
        <div className='influencers'>
          {this.props.influencers.map(function (influencer) {
            return (
              <InfluencerListElement href={'/meta?href=' + influencer.href} influencer={influencer} />
            )
          })}
        </div>
      </div>
    )
  }
})