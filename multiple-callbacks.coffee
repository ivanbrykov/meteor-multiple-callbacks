Template = Package.templating.Template
Template._multiple_callbacks = {}
_bootstrap_callbacks = []
_.each ['created', 'rendered', 'destroyed'], (callback_name) ->
  Template._multiple_callbacks[callback_name] = {}
  Template[callback_name] = (args...) ->
    callback = args.pop()
    template_names = if args.length then args else [null]
    _.each template_names, (template_name) =>
      Template._multiple_callbacks[callback_name][template_name] ||= []
      Template._multiple_callbacks[callback_name][template_name].push callback

  _bootstrap_callbacks.push ->
    for template_name of Template
      template = Template[template_name]
      ((template_name, template ) ->
        if template instanceof Blaze.Template
          _previous_callback = Template[template_name][callback_name]
          Template[template_name][callback_name] = ->
            self = @
            _.each _.union([_previous_callback], Template._multiple_callbacks[callback_name][template_name], Template._multiple_callbacks[callback_name][null]), (func)->
              _.isFunction(func) && func.bind(self)()
      )(template_name, template)

Meteor.startup ->
  _.each _bootstrap_callbacks, (bootstrap_code) ->
    bootstrap_code()
