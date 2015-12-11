var PopoverContent = React.createClass({
  getInitialState: function(){
    return({
      content: null
    })
  },
  render: function() {
    var content = this.state.content ? this.state.content : {}
    // console.log(this.state.content != null)
    // console.log(content)
    var contentClasses = classNames({
      'popover-source-content': true,
      'is-loaded': this.state.content != null
    })

    var bannerStyle = {
      backgroundImage: 'url(' + content.avatar + ')'
    };


    return (
      <div className={contentClasses}>
        <div className="spinner" />
        <div className='popover-header-wrapper'>
          <div className='popover-header' style={bannerStyle}></div>
        </div>
        <img src={content.avatar} className='avatar avatar-xl' />

        <h3 className='source-name text-center'>
          <span>{content.name}</span>
        </h3>
        <div className='text-center source-href'>
          <a href={content.url} target="_blank">{content.stripped_url}</a>
        </div>
        <p className='text-center'>
          Recommended by:
        </p>
        <a href={"https://twitter.com/" + (content.suggested ? content.suggester.twitter_id : "")} className="twitter-username" target="_blank">
          <ul className="list-unstyled list-inline">
            <li><img src={content.suggested ? content.suggester.picture : ""} className='avatar-user-mini' /></li>
            <li>@{content.suggested ? content.suggester.twitter_id : ""}</li>
          </ul>
        </a>
      </div>
    )
  },

  componentDidMount: function(){
    var that = this
    $.get(that.props.dataSourcePath, function(data){
      that.setState({
        content: data
      })
    })
  },

  componentWillUnmount: function(){
    this.setState({
      content: null
    })
  }
})