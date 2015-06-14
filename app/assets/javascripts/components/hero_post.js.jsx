//= 'kudos_services.js'

var HeroPost = React.createClass({
  render: function() {
    var heroPost = this.props.heroPost

    var backgroundImage = {
      backgroundImage: 'url(' + heroPost.article_picture + ')'
    }

    return (
      <div className='hero-post'>
        <div className='l-loader'>
          <div>
            <div className="spinner" />
            <div className="text-center">Getting the freshest from <span className='highlighted'>{heroPost.name}</span></div>
          </div>
        </div>
        <div className='iframe-container'>
          <iframe ref="embedArticle" src={heroPost.article_url} sandbox />
        </div>
        <div className='hero-profile'>
          <div>
            <figure className="kudo kudoable" data-id="1">
              <a className="kudobject">
                <div className="opening"><div className="circle">&nbsp;</div></div>
              </a>
              <a href="#kudo" className="count">
                <span className="txt text-center">Did you enjoy the read ?</span>
              </a>
            </figure>
          </div>
          <div className='clear' />
        </div>
      </div>
    )
  },

  componentDidMount: function(){
    var iframe = $('.hero-post iframe')
    $('.hero-post iframe').on('load', function(){
      $('.l-loader').remove();
    })
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})