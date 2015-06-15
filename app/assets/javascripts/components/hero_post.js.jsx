//= 'kudos_services.js'

var HeroPost = React.createClass({
  getInitialState: function() {
    return {
      iframeLoaded: false
    };
  },

  render: function() {
    var heroPost = this.props.heroPost

    var backgroundImage = {
      backgroundImage: 'url(' + heroPost.article_picture + ')'
    }

    var loaderClasses = React.addons.classSet({
      'l-loader': true,
      'is-hidden': this.state.iframeLoaded
    })

    var iframeClasses = React.addons.classSet({
      'is-visible': this.state.iframeLoaded
    })

    return (
      <div className='hero-post'>
        <div className={loaderClasses}>
          <div>
            <div className="spinner" />
            <div className="text-center">Getting the freshest from <span className='highlighted'>{heroPost.name}</span></div>
          </div>
        </div>
        <div className='iframe-container'>
          <iframe className={iframeClasses} ref="embedArticle" onLoad={this.handleLoad} src={heroPost.article_url}  />
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

  handleLoad: function() {
    this.setState({
      iframeLoaded: true
    })
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})