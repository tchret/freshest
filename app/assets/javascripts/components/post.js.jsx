var Post = React.createClass({
  getInitialState: function() {
    return {
      opened: false
    };
  },
  render: function() {
    var influencer = this.props.influencer
    var iframeable = influencer.iframeable

    return (
      <div className="post-container">
        <div className="container">
            <div className={"post post-" + influencer.id } onClick={this.displayPost}>
              <div className='col-xs-10 col-sm-10'>
                <ul className="list-unstyled list-inline influencer-infos">
                  <li>
                    {influencer.name}
                  </li>
                  <li className="font-light color-light small">
                    {timeSince(new Date(influencer.last_post_at))} ago
                  </li>
                </ul>
                <div className="post-content">
                    <h4>
                      <span>
                        {influencer.title}
                      </span>
                    </h4>
                  <p>
                    {influencer.description}
                  </p>
                </div>
              </div>
              <div className="col-sm-2 col-xs-2 post-avatar p20 kill-pr">
                <img src={influencer.avatar_url} className="img total-width shadowed border-radius-2" />
              </div>
              <div className='clear' />
            </div>
        </div>
      </div>
    )
  },

  displayPost: function() {
    this.setState({
      opened: true
    })
    var influencer = this.props.influencer
    if (influencer.iframeable) {
      this.props.parentComponent.handleHeroPostDisplay(this.props.influencer)
    } else {
      window.open(influencer.article_url, '_blank')
    }
  },

  componentDidMount: function(){
  }
})
