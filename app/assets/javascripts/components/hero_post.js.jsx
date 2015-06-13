var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost

    var backgroundImage = {
      backgroundImage: 'url(' + heroPost.article_picture + ')'
    }

    return (
      <div className='hero-post'>

        <div className='l-loader'>
          <div className="spinner" />
        </div>
        <iframe ref="embedArticle" src={heroPost.article_url} />
      </div>
    )
  },

  componentDidMount: function(){
    $('.hero-post iframe').on('load', function(){
      $('.l-loader').remove()
    })
  }
})