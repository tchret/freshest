var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost

    return (
      <div className='hero-post'>
        <a className="hero-post-link" href={heroPost.article_url} target="_blank">
        </a>
        <div className="post-avatar">
          <img src={heroPost.avatar_url} className="img total-width border-radius-1 hidden-xs" />
        </div>
        <h3>{heroPost.name}</h3>
        <img src={heroPost.article_picture} className="img total-width border-radius-1" />
        <p dangerouslySetInnerHTML={{__html: heroPost.content}}>
        </p>
      </div>
    )
  }
})