# {View} = require 'atom'
#
# module.exports =
# class SearchView extends View
#   @content: ->
#     @div class: 'search overlay from-top', =>
#       @div "The Search package is Alive! It's ALIVE!", class: "message"
#
#   initialize: (serializeState) ->
#     atom.workspaceView.command "search:toggle", => @toggle()
#
#   # Returns an object that can be retrieved when package is activated
#   serialize: ->
#
#   # Tear down any state and detach
#   destroy: ->
#     @detach()
#
#   toggle: ->
#     console.log "SearchView was toggled!"
#     if @hasParent()
#       @detach()
#     else
#       atom.workspaceView.append(this)
