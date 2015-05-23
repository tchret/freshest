var Layout = React.createClass({
  getInitialState: function() {
    return {
      heroPost: null
    };
  },

  render: function() {
    if (this.state.heroPost) {

      heroPost = <HeroPost heroPost={this.state.heroPost} />

    } else {

      heroPost = ''

    }

    return(
      <div className='layout-container'>
        <Sidebar influencers={this.props.influencers} layout={this} />
        {heroPost}
        <div clasName='clear' />
      </div>
    )
  },

  displayPost: function(post) {
    console.log(post)
    this.setState ({
      heroPost: post
    })
  }
})