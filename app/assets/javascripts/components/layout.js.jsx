var Layout = React.createClass({
  getInitialState: function() {
    return {
      heroPost: this.props.heroPost,
      heroPostPresent: this.props.heroPost ? true : false,
      redirection: false,
      posts: this.props.sources,
      pageLoaded: 1,
      lastPage: this.props.lastPage,
      modalConnectOpened: false,
      allPostsLoaded: false
    };
  },

  render: function() {
    if (this.state.heroPost) {
      heroPost = <HeroPost heroPost={this.state.heroPost} handleCross={this.handleCross} closeModal={this.removeHeroPostState} />
      $('body').addClass('no-scroll')
    } else {
      $('body').removeClass('no-scroll')
      heroPost = ''
    }

    var heroPostClasses = React.addons.classSet({
      'hero-post-modal': true,
      'is-active': this.state.heroPost == null ? false : true
    })

    var crossClasses = React.addons.classSet ({
      "cross-container": true,
      "pointer": true,
      'visible': this.state.heroPost ? true : false,
    })
    var that = this

    console.log( this.state.allPostsLoaded)
    var paginateHelperValue = this.state.allPostsLoaded ? "That's all " : "Getting old latest stuff"

    return(
      <div className='layout-container' onScroll={this.listenToLoad}>
        {this.state.posts.map(function (source, key) {
          if (key == 2) {
            return(
              <div>
                <Post source={source} parentComponent={this} crispAverage={this.props.crispAverage}/>
                <div className='interstitial-twitter'>
                  <div className='container'>
                      <p>
                        Get the freshest news from the best sources on Twitter !
                      </p>
                      <a href="https://twitter.com/frshst" target="_blank" className='button button-white'>Follow us on Twitter</a>
                  </div>
                </div>
              </div>
            )
          } else {
            return(<Post source={source} parentComponent={this} crispAverage={this.props.crispAverage} />)
          }
        }, this)}
          <div className='paginate-helper'>
            <div className='container'>
              {paginateHelperValue}
              <div className={!this.state.allPostsLoaded ? "hidden" : "visible"}>
                <ModalConnect last_sources_images={this.props.lastSourcesImages}/>
              </div>
              <VisibilitySensor onChange={this.loadMorePost} active={this.state.allPostsLoaded ? false : true}/>

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
      heroPost: post,
      heroPostPresent: true
     })
    urlPath = '/i/' + post.twitter_id
    pageTitle = post.name + 'on Freshest'
    window.history.pushState('', pageTitle, urlPath)
  },

  removeHeroPostState: function(post) {
    this.setState({
      heroPost: null,
      heroPostPresent: true
    })
    window.history.pushState('', "Freshest", '/')
  },

  handleCross: function(){
    this.removeHeroPostState()
  },

  loadMorePost: function(isVisible){
    var that = this
    if (that.state.pageLoaded == that.state.lastPage) {
      that.setState({
        allPostsLoaded: true
      })
      console.log('all post loaded ! ')
    } else if (isVisible){
      console.log("Visible")
      $.get('/page?n=' + (that.state.pageLoaded + 1), function(data){
        var posts = that.state.posts;
        data.posts.map(function(post){
          posts.push(post)
        })

        that.setState({
          posts: posts,
          pageLoaded: that.state.pageLoaded + 1
        })
      })
    }
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})

