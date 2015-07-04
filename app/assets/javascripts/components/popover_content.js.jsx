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

    return (
      <div className={contentClasses}>
        <div className="spinner" />
        <img src={content.avatar} className='avatar' />
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