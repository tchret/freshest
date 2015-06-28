var Dashboard = React.createClass({
  render: function() {
    var that = this

    if (this.props.userSignedIn) {
      var modal = <ModalSource
          currentUser={this.props.currentUser}
          suggestionPath={this.props.suggestPath} />
    } else {
      var modal = <ModalConnect
          href={this.props.oauthPath}
          last_sources_images={this.props.lastSourcesImages} />
    }
    return(
      <div className='dashboard'>
        {modal}
        {this.props.sources.map(function (source) {
          return(<SourceTile source={source.infos} parent={this} isOn={source.isOn} follow_path={source.follow_path} toggleable={that.props.toggleable} stop_following_path={source.stop_following_path}/>)
        }, that)}
      </div>
    )
  }
})