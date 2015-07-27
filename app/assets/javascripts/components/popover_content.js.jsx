var PopoverContent = React.createClass({
  getInitialState: function(){
    return({
      content: null
    })
  },
  render: function() {
    var content = this.state.content ? this.state.content : {}
    console.log(this.state.content != null)
    console.log(content)
    var contentClasses = React.addons.classSet({
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
          <a href={content.url}>{content.url}</a>
        </div>
        <p clasName='text-center'>
          Recommended by {content.suggested ? content.suggester.name : ""}
        </p>
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