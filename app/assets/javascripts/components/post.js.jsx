var Post = React.createClass({
  getInitialState: function() {
    return {
      opened: false
    };
  },
  render: function() {
    var source = this.props.source
    var iframeable = source.iframeable
    return (
      <div className="post-container">
        <div className="container">
            <div className={"post post-" + source.id } onClick={this.displayPost}>
              <div className='col-xs-12 col-sm-10'>
                <ul className="list-unstyled list-inline source-infos">
                  <li>
                    {source.name}
                  </li>
                  <li className="font-light color-light small">
                    {timeSince(new Date(source.last_post_at))} ago
                  </li>
                </ul>
                <div className="post-content">
                    <h4>
                      {source.title}
                    </h4>
                  <p>
                    {source.description}
                  </p>
                </div>
              </div>
              <div className="col-sm-2 hidden-xs post-avatar p20 kill-pr">
                <img src={source.avatar_url} className="img total-width shadowed border-radius-2" />
              </div>
              <div className='clear' />
            </div>
        </div>
      </div>
    )
  },

  displayPost: function() {
    var source = this.props.source
    if (source.iframeable) {
      this.props.parentComponent.handleHeroPostDisplay(this.props.source)
    } else {
      window.open(source.article_url, '_blank')
    }
  },

  componentDidMount: function(){
  }
})
