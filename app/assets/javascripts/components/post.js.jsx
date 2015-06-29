var Post = React.createClass({
  getInitialState: function() {
    return {
      opened: false
    };
  },
  render: function() {
    var source = this.props.source;
    var iframeable = source.iframeable;
    var isCrisp = this.props.crispAverage > source.last_post_at_in_minutes;
    var containerClasses = React.addons.classSet({
      "post-container": true,
      "crisp": isCrisp,
      "container": true
    })

    return (
      <article className={containerClasses}>
        <div className='post-content'>
            <div className={"post post-" + source.id } onClick={this.displayPost}>
              <ul className="list-unstyled list-inline source-infos">
                <li className='source-name'>
                  {source.name}
                </li>
                <li className="font-light color-light small">
                  {timeSince(new Date(source.last_post_at))} ago
                </li>
              </ul>
              <div className='col-xs-10 col-sm-10'>
                <div className="post-content">
                    <h4>
                      {source.title}
                    </h4>
                  <p>
                    {source.description}
                  </p>
                </div>
              </div>
              <div className="col-xs-2 post-avatar p20 kill-pr">
                <img src={source.avatar_url} className="img total-width shadowed border-radius-2" />
              </div>
              <div className='clear' />
            </div>
        </div>
      </article>
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
