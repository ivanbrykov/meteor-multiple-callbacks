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
  api.use(['tinytest', 'test-helpers', 'templating', 'multiple-callbacks'], 'client');
  api.add_files('multiple-callbacks-test.html', 'client');
  api.add_files('multiple-callbacks-test.js', 'client');
});
