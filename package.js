Package.describe({
  summary: "Multiple template callbacks implementation for Meteor"
});

Package.on_use(function (api) {
//  api.export('multiple-callbacks');

  api.use('underscore', 'client');
  api.use('templating', 'client');
  api.add_files(['multiple-callbacks.js'], 'client');
});

Package.on_test(function (api) {
  // TODO: write tests
});
