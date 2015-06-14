var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost

    var backgroundImage = {
      backgroundImage: 'url(' + heroPost.article_picture + ')'
    }

    return (
      <div className='hero-post' onClick={this.stopPropagation}>
        <div className='l-loader'>
          <div>
            <div className="spinner" />
            <div className="text-center">Getting the freshest from <span className='highlighted'>{heroPost.name}</span></div>
          </div>
        </div>
        <div className='iframe-container'>
          <iframe ref="embedArticle" src={heroPost.article_url} />
        </div>
        <div className='hero-profile'>
          <div className='col-xs-1'>
            <img src={heroPost.avatar_url} />
          </div>
          <h1>{heroPost.name}</h1>

        </div>
      </div>
    )
  },

  componentDidMount: function(){
    var iframe = $('.hero-post iframe')
    $('.hero-post iframe').on('load', function(){
      $('.l-loader').remove()
    })
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})