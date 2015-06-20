var Post = React.createClass({
  render: function() {
    var influencer = this.props.influencer

    return (
      <div className="post-container">
        <div className="container">
          <div className="post" onClick={this.displayPost}>
            <div className='col-xs-12 col-sm-10'>
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
                    {influencer.title}
                  </h4>
                <p>
                  {influencer.description}
                </p>
              </div>
            </div>
            <div className="col-sm-2 hidden-xs post-avatar p20 kill-pr">
              <img src={influencer.avatar_url} className="img total-width shadowed border-radius-2" />
            </div>
            <div className='clear' />
          </div>
        </div>
      </div>
    )
  },
  updateUrl: function(twitterId, name) {

  },

  displayPost: function() {
    this.props.parentComponent.handleHeroPostDisplay(this.props.influencer)

  }


})
