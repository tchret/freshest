var Layout = React.createClass({

  render: function() {
    return(
      <Sidebar influencers={this.props.influencers} layout={this} />
    )
  },

  displayPost: function(post) {
    console.log(post)
  }
})