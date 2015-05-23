var Sidebar = React.createClass({
  render: function (){
    return (
      <div className='sidebar'>
        {this.props.influencers.map(function (influencer) {
            return (
              <InfluencerListElement href={'/meta?href=' + influencer.href} parentSidebar={this} influencer={influencer} />
            )
        })}
      </div>
    )
  },

  handlePostChange: function(post) {
    // this.props.layout.displayPost(post)
    console.log(post)
  }
})