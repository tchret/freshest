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
      <div>
      {modal}
        <div className='dashboard'>
          {this.props.sources.map(function(source, index) {
            return(<SourceTile
              source={source.infos}
              parent={this} isOn={source.isOn}
              follow_path={source.follow_path}
              toggleable={that.props.toggleable}
              stop_following_path={source.stop_following_path}
              dataSourcePath={source.dataSourcePath}
              key={index}
              reactKey={index} />)
          }, that)}
        </div>
      </div>
    )
  }
})