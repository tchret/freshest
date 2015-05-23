var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost
    var bannerStyle = {
      backgroundImage: 'url(' + heroPost.banner_url + ')' ,
      backgroundSize: 'cover'
    }

    return (

      <div className='hero-post'>
        <div className='banner-image' style={bannerStyle} />
      </div>

    )
  }
})