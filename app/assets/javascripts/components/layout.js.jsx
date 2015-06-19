var Layout = React.createClass({
  getInitialState: function() {
    return {
      heroPost: this.props.heroPost,
      iframeLoaded: false,
      redirection: false
    };
  },

  render: function() {
    if (this.state.heroPost) {
      heroPost = <HeroPost heroPost={this.state.heroPost} handleCross={this.handleCross} />
      $('body').addClass('no-scroll')
    } else {
      $('body').removeClass('no-scroll')
      heroPost = ''
    }

    heroPostClasses = React.addons.classSet({
      'hero-post-modal': true,
      'is-active': this.state.heroPost == null ? false : true
    })

    crossClasses = React.addons.classSet ({
      "cross-container": true,
      "pointer": true,
      'visible': this.state.iframeLoaded
    })

    return(
      <div className='layout-container'>
        {this.props.influencers.map(function (influencer) {
          return(<Post influencer={influencer} parentComponent={this} />)
        }, this)}
        <div className='interstitial-twitter'>
          <div className='container'>
              <p>
                Get the freshest news of the best sources on Twitter !
              </p>
              <a className='button button-white'>Follow us on Twitter</a>
          </div>
        </div>
        <div className={heroPostClasses} onClick={this.removeHeroPostState}>
          <div className={crossClasses} onClick={this.handleCross}>
            <div id='cross'></div>
          </div>
          <div className="hero-post-container" onClick={this.stopPropagation}>
            {heroPost}
          </div>
        </div>
      </div>
    )
  },

  handleHeroPostDisplay: function(post) {
    this.setState({
      heroPost: post
    })
    urlPath = '/i/' + post.twitter_id
    pageTitle = post.name + 'on Freshest'
    window.history.pushState('', pageTitle, urlPath)


  },

  removeHeroPostState: function(post) {
    this.setState({
      heroPost: null
    })
    window.history.pushState('', "Freshest", '/')
  },

  handleCross: function() {
    this.setState({
      iframeLoaded: this.state.iframeLoaded ? false : true
    })
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})