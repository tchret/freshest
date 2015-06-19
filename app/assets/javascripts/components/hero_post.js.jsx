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

    var iframeClasses = React.addons.classSet({
      'is-visible': this.state.iframeLoaded
    })

    var btnClasses = React.addons.classSet({
      'button': true,
      'button-wait': true,
      'is-hidden': !this.state.btnArticle
    })

    return (
      <div className='hero-post' onLoad={this.handleRedirection}>
        <div className={loaderClasses}>
          <div>
            <div className="spinner" />
            <div className="text-center catch-waiting">Getting the freshest from <span className='highlighted'>{heroPost.name}</span></div>
            <div className='text-center'>
              <div className={btnClasses}>Watch it on {heroPost.name}</div>
            </div>
          </div>
        </div>
        <div className='iframe-container'>
          <iframe className={iframeClasses} ref="embedArticle" onLoad={this.handleLoad} src={heroPost.article_url}  />
        </div>
      </div>
    )
  },

  handleLoad: function() {
    this.setState({
      iframeLoaded: true
    })

    this.props.handleCross()
  },

  componentDidMount: function(){

    iframe = $('iframe')[0]
    var that = this
    setTimeout(function(){
      $('.catch-waiting').text('Seems to take time...')
      $('.button-wait').removeClass('is-hidden')
    }, 4000)

    var timepast = false;
    // If more then 500ms past that means a page is loading inside the iFrame (security 1)
    setTimeout(function() {
        timepast = true;
    },1000);

    if (iframe.attachEvent){
        iframe.attachEvent("onload", function(){
        if(timepast) {
                console.log("It's PROBABLY OK");
            }
            else {
                console.log("It's PROBABLY NOT OK");
            }
        });
    }
    else {
        iframe.onload = function(){
          if(timepast) {
          }
          else {
            console.log("It's PROBABLY NOT OK");
            window.open(that.props.heroPost.article_url, '_blank');
          }
        };
    }
  },

  stopPropagation: function(e){
      e.stopPropagation();
      e.nativeEvent.stopImmediatePropagation();
  }
})