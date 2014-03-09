open = require 'open'

module.exports =
  activate: ->
    atom.workspaceView.command 'search:google', =>
      console.log 'search google'
      open('http://www.google.com/#q=Atom+Editor')
    atom.workspaceView.command 'search:ddg', =>
      console.log 'search ddg'
      open('https://www.duckduckgo.com/?q=Atom+Editor')
    atom.workspaceView.command 'search:twitter', =>
      console.log 'search twitter'
      open('https://twitter.com/search?q=Atom%20Editor')
    atom.workspaceView.command 'search:github', =>
      console.log 'search github'
      open('https://github.com/search?q=Atom+Editor')

  toggle: ->
    console.log "hello, search!"
  #   console.log 'toggle search'
  #
  # atom.workspaceView.commands = 'search:new', ->
  #   console.log 'hello, again'

    # open('https://google.com')

  # activate: (state) ->
  #   @searchView = new SearchView(state.searchViewState)
  #
  # deactivate: ->
  #   @searchView.destroy()
