var Post = React.createClass({
  render: function() {
    var influencer = this.props.influencer

    return (
      <div className="post-container">
        <div className="container">
          <div className="post" onClick={this.displayPost}>
            <div className="post-avatar">
              <img src={influencer.avatar_url} className="img total-width border-radius-1 hidden-xs" />
            </div>
            <ul className="list-unstyled list-inline influencer-infos">
              <li>
                <a className="influencer-link">
                  {influencer.name}
                </a>
              </li>
              <li className="font-light color-light small">
                10minutes ago
              </li>
            </ul>
            <div className="post-content">
              <a href={influencer.article_url} target='_blank' className='link-title'>
                <h4>
                  {influencer.title}
                </h4>
              </a>
              <p>
                {influencer.description}
              </p>
            </div>
          </div>
        </div>
      </div>
    )
  },

  displayPost: function() {
    this.props.parentComponent.handleHeroPostDisplay(this.props.influencer)
  }
})
