# meteor-multiple-callbacks

Multiple template callbacks implementation for Meteor.

The main purpose of this package is providing support of multiple ```created/rendered/destroyed``` callbacks for Meteor templates.

## Usage

Add the package to your app:

```
meteor add xorax:multiple-callbacks
```

Add callbacks to your templates using the following API:

```javascript
Template.created('template_name', function(){...})
Template.rendered('template_name', function(){...})
Template.destroyed('template_name', function(){...})
```

You can omit template name parameter. In this case the handler will be applied to all your templates:

```javascript
Template.rendered(function(){...})
```

Also you can apply the callback to multiple templates at once:

```javascript
Template.created('template_name1', 'template_name2', 'template_name3', function(){...})
```
