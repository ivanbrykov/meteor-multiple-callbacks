
materialize = (content, parent) ->
  func = content;
  if typeof content != 'function'
    func = ->
      return content
  Blaze.render(func).attach(parent);

render = (comp) ->
  div = document.createElement("div")
  materialize(comp, div)
  document.body.appendChild(div)

Tinytest.addAsync 'attaching created callback', (test, cb) ->
  fail_timeout = setTimeout ->
    test.fail({message: 'Timed out!'})
    cb()
  , 1000
  Template.created 'testBasicCreated', ->
    clearTimeout fail_timeout
    test.ok()
    cb()
  div = render(Template['testBasicCreated'])
  div.remove()


Tinytest.addAsync 'attaching rendered callback', (test, cb) ->
  fail_timeout = setTimeout ->
    test.fail({message: 'Timed out!'})
    cb()
  , 1000
  Template.rendered 'testBasicRendered', ->
    clearTimeout fail_timeout
    test.ok()
    cb()
  div = render(Template['testBasicRendered'])
  div.remove()

Tinytest.addAsync 'attaching destroyed callback', (test, cb) ->
  fail_timeout = setTimeout ->
    test.fail({message: 'Timed out!'})
    cb()
  , 1000
  Template.destroyed 'testBasicDestroyed', ->
    clearTimeout fail_timeout
    test.ok()
    cb()
  Template.rendered 'testBasicDestroyed', ->
    @__view__.domrange.destroy()
  render(Template['testBasicDestroyed'])


Template['testStandardCallbacksCompatibility'].rendered = ->
  @__standard_rendered_ok__ = true

Tinytest.addAsync 'dealing with standard rendered callback', (test, cb) ->
  fail_timeout = setTimeout ->
    test.fail({message: 'Timed out!'})
    cb()
  , 1000
  Template.rendered 'testStandardCallbacksCompatibility', ->
    clearTimeout fail_timeout
    test.isTrue @__standard_rendered_ok__
    cb()
  div = render(Template['testStandardCallbacksCompatibility'])
  div.remove()

Tinytest.addAsync 'attach rendered callback to multiple templates at once', (test, cb) ->
  fail_timeout = setTimeout ->
    test.fail({message: 'Timed out!'})
    cb()
  , 1000
  _multiple_callback_log = []
  Template.rendered 'testMultipleTemplates1', 'testMultipleTemplates2', 'testMultipleTemplates3', ->
    _multiple_callback_log.push(true)
    if _multiple_callback_log.length==3
      clearTimeout fail_timeout
      test.ok()
      cb()
  render(Template['testMultipleTemplates1'])
  render(Template['testMultipleTemplates2'])
  render(Template['testMultipleTemplates3'])
