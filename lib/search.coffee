open = require 'open'

# The purpose of this module is to open a search page for a user for a
# particular site. From the command palette, the user can start typing
# *search* to see all search options or start typing the names of one
# of the supported sites to get directly to that option.
# Upon selecting one of the searches, one of two things will happen:
# - If the user has selected text in the editor, then a search
#   URL for the chosen site will be constructed and opened in the user's
#   browser.
# - If the user has no selected text in the editor, then the URL for
#   the base search for the chosen site will be opened in the user's
#   browser.
#
# Note: The user's default browser will be used.

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
      # `encodeURI` makes sure spaces are properly encoded so that the browser
      # can successfully open the URL.
      encodeURI(@baseSearchUrls[site] + @searchPrefixes[site] + searchTerm)

  # activate: (state) ->
  #   @searchView = new SearchView(state.searchViewState)
  #
  # deactivate: ->
  #   @searchView.destroy()
