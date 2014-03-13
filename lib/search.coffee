open = require 'open'

module.exports =
  activate: ->
    atom.workspaceView.command 'search:google', =>
      open @getSearchUrl('google')
    atom.workspaceView.command 'search:ddg', =>
      open @getSearchUrl('duckduckgo')
    atom.workspaceView.command 'search:twitter', =>
      open @getSearchUrl('twitter')
    atom.workspaceView.command 'search:github', =>
      open @getSearchUrl('github')
    atom.workspaceView.command 'search:stackoverflow', =>
      open @getSearchUrl('stackoverflow')
    # currently only supporting wikipedia in English
    atom.workspaceView.command 'search:wikipedia', =>
      open @getSearchUrl('wikipedia')

  baseSearchUrls:
    google: 'https://www.google.com/'
    duckduckgo: 'https://www.duckduckgo.com/'
    twitter: 'https://twitter.com/search'
    github: 'https://github.com/search'
    stackoverflow: 'http://stackoverflow.com/search'
    wikipedia: 'http://en.wikipedia.org/'

  searchPrefixes:
    google: '#q='
    duckduckgo: '?q='
    twitter: '?q='
    github: '?q='
    stackoverflow: '?q='
    wikipedia: 'w/index.php?search='

  getSearchTerm: ->
    # assumes an editor is in focus
    editor = atom.workspaceView.getActivePaneItem()
    searchText = editor.getSelectedText()

  getSearchUrl: (site) ->
    searchTerm = @getSearchTerm()
    if searchTerm == ""
      @baseSearchUrls[site]
    else
      encodeURI(@baseSearchUrls[site] + @searchPrefixes[site] + searchTerm)

  # activate: (state) ->
  #   @searchView = new SearchView(state.searchViewState)
  #
  # deactivate: ->
  #   @searchView.destroy()
