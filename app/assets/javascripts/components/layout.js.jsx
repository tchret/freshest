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
      heroPost = <HeroPost
        heroPost={this.state.heroPost}
        handleCross={this.handleCross}
        closeModal={this.removeHeroPostState}
        switchIsOn={this.props.switchIsOn}
        toggleable={this.props.userSignedIn} />
      $('html').addClass('no-scroll')
    } else {
      $('html').removeClass('no-scroll')
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
    var paginateHelperValue = this.state.allPostsLoaded ? "That's all for now" : "Getting more fresh stuff"

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
        <a href='http://producthunt.com' target='_blank'>
        <div className={this.getParameterByName("ref") == "producthunt" ? "ph-interstitiel" : "hidden"}>
          <img className='cat hidden-sm hidden-xs' src='http://betakit.com/wp-content/uploads/2015/03/product-hunt-kitten.png' />
          <article className="post-container container">
            <div className='post-content'>
                <div className={"post"} onClick={this.displayPost}>
                  <ul className="list-unstyled list-inline source-infos">
                    <li className='source-name'>
                      Product Hunt
                    </li>
                    <li className="font-light color-light small">
                      Today !
                    </li>
                  </ul>
                  <div className='col-xs-10 col-sm-10'>
                    <div className="post-content">
                        <h4>
                          Freshest
                        </h4>
                      <p>
                        "Freshest brings you the latest stuff from your favorite sources, in real time. It's a short-lived batch of resources from the modern web, continuously curated by CRISP, our algorithm."
                      </p>
                    </div>
                  </div>
                  <div className="col-xs-2 post-avatar p20 kill-pr">
                    <img src="https://pbs.twimg.com/profile_images/615519634695979008/W_E9I7T7_400x400.png" className="img total-width shadowed border-radius-2" />
                  </div>
                  <div className='clear' />
                </div>
            </div>
          </article>
        </div>
        </a>


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

  getParameterByName: function(name) {
      name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
      var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
          results = regex.exec(location.search);
      return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
  },

  handleHeroPostDisplay: function(post) {
    var that = this
    post.switchIsOn = true
    that.setState({
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

