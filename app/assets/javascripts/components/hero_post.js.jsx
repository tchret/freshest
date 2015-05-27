var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost

    return (
      <div className='hero-post'>
        {heroPost.name}
      </div>
    )
  }
})