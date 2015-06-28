var Layout = React.createClass({
  getInitialState: function() {
    return {
      heroPost: this.props.heroPost,
      heroPostPresent: this.props.heroPost ? true : false,
      redirection: false,
      posts: this.props.sources,
      pageLoaded: 1,
      lastPage: this.props.lastPage,
      modalOpened: false,
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
    var paginateHelperValue = this.state.allPostsLoaded ? "That's all " : "Getting old latest stuff"

    if (this.props.userSignedIn) {
      var modal = <ModalSource
          currentUser={this.props.currentUser}
          suggestionPath={this.props.suggestPath} />
    } else {
      var modal = <ModalConnect
          href={this.props.oauthPath}
          last_sources_images={this.props.lastSourcesImages}
          opened={this.state.modalOpened} />
    }

    return(
      <div className='layout-container' >
        {modal}

        {this.state.posts.map(function (source, key) {
          if (key == 2) {
            return(
              <div>
                <Post source={source} parentComponent={this} key={key} crispAverage={this.props.crispAverage}/>
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
          <div className={this.state.allPostsLoaded ? 'paginate-helper thats-all' : 'paginate-helper'}>
            <div className='container'>
              <h4>
                {paginateHelperValue}
                <div className='text-center'>
                  <div className='button' onClick={this.displayModal}>Add more sources</div>
                </div>
              </h4>
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

  displayModal: function(){
    if (!this.props.userSignedIn){
      this.setState({
        modalOpened: true
      })
    } else {
      PubSub.publish("displayModalSource")
    }
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
    } else if (isVisible){
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

