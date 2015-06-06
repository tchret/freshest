var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost

    var backgroundImage = {
      backgroundImage: 'url(' + heroPost.article_picture + ')'
    }

    return (
      <div className='hero-post'>
        <div className='hero-header'>
          <div className='bg-blur l-background-0' style={backgroundImage}/>
          <div className='l-content hero-header-content'>
            <div className='col-xs-10'>
              <h3>{heroPost.title}</h3>
              <p>{heroPost.description}</p>
            </div>
            <div className='col-xs-2 p25'>
              <img src={heroPost.avatar_url} className="img total-width border-radius-1 hidden-xs" />
            </div>
            <div className='clear' />
          </div>
        </div>
        <a className="hero-post-link" href={heroPost.article_url} target="_blank">
        </a>

        <h3>{heroPost.name}</h3>
        <p dangerouslySetInnerHTML={{__html: heroPost.content}}>
        </p>
      </div>
    )
  }
})