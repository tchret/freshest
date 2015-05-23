var Layout = React.createClass({
  getInitialState: function() {
    return {
      heroPost: this.props.heroPost
    };
  },

  render: function() {
    return(
      <Sidebar influencers={this.props.influencers} layout={this} />
    )
  },

  displayPost: function(post) {
    console.log(post)
  }
})