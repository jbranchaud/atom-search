open = require 'open'

module.exports =
  activate: ->
    atom.workspaceView.command 'search:google', =>
      url = @getSearchUrl('google')
      console.log url
      open(url)
    atom.workspaceView.command 'search:ddg', =>
      url = @getSearchUrl('duckduckgo')
      console.log url
      open(url)
    atom.workspaceView.command 'search:twitter', =>
      url = @getSearchUrl('twitter')
      console.log url
      open(url)
    atom.workspaceView.command 'search:github', =>
      url = @getSearchUrl('github')
      console.log url
      open(url)
    atom.workspaceView.command 'search:bing', =>
      url = @getSearchUrl('bing')
      console.log url
      open(url)

  baseSearchUrls:
    google: 'https://www.google.com/'
    duckduckgo: 'https://www.duckduckgo.com/'
    twitter: 'https://twitter.com/search'
    github: 'https://github.com/search'
    bing: 'https://www.bing.com/'

  searchPrefixes:
    google: '#q='
    duckduckgo: '?q='
    twitter: '?q='
    github: '?q='
    bing: '?q='

  getSearchTerm: ->
    # assumes an editor is in focus
    editor = atom.workspaceView.getActivePaneItem()
    searchText = editor.getSelectedText()

  getSearchUrl: (site) ->
    searchTerm = @getSearchTerm()
    if searchTerm == ""
      @baseSearchUrls[site]
    else
      @baseSearchUrls[site] + @searchPrefixes[site] + @robotizeSearchTerm(searchTerm)

  # transform the search term so that it can be appended to the URL
  # this means:
  # - replace whitespaces with +
  # - #TODO remove/replace certain punctuation
  robotizeSearchTerm: (term) ->
    term.replace(' ', '+')

  # activate: (state) ->
  #   @searchView = new SearchView(state.searchViewState)
  #
  # deactivate: ->
  #   @searchView.destroy()
