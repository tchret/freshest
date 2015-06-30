//= 'kudos_services.js'

var HeroPost = React.createClass({
  getInitialState: function() {
    return {
      iframeLoaded: false,
      btnArticle: false
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

    var btnClasses = React.addons.classSet({
      'button': true,
      'button-wait': true,
      'is-hidden': !this.state.btnArticle
    })

    return (
      <div className='hero-post' onLoad={this.handleRedirection}>
        <div className="l-loader">
          <div>
            <div className="spinner" />
            <div className="text-center catch-waiting">Getting the freshest from <span className='highlighted'>{heroPost.name}</span></div>
            <div className='text-center'>
              <a href={heroPost.article_url} onClick={this.handleModal} target='_blank' className={btnClasses}>Go to original content</a>
            </div>
          </div>
        </div>
        <div className='iframe-container'>
          <iframe className="is-visible" ref="embedArticle" onLoad={this.handleLoad} src={heroPost.article_url}  />
        </div>
        <footer className='hero-footer'>
          <img src={heroPost.avatar_url} />
          <ul className='list-inline'>
            <a href={heroPost.article_url} target='_blank'>
              <li className='original-link'>
                GO TO ORIGINAL CONTENT
              </li>
            </a>
          </ul>
          <div className='clear' />
        </footer>
        <div className='helper-container hidden'>
          <div className='text-center'>
            <p>
              Oops, the content of <strong>{heroPost.title}</strong> could not be opened here
            </p>
            <a href={heroPost.article_url} onClick={this.handleModal} target='_blank' className="button">Go to original content</a>
          </div>
        </div>
      </div>
    )
  },

  handleModal: function(){
    this.props.closeModal()
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})