Package.describe({
  summary: "Multiple template callbacks implementation for Meteor",
  version: "0.1.4",
  name: "xorax:multiple-callbacks",
  git: "https://github.com/brykov/meteor-multiple-callbacks.git"
});

Package.on_use(function (api) {
//  api.export('multiple-callbacks');

  api.use('underscore@1.0.0', 'client');
  api.use('templating@1.0.5', 'client');
  api.add_files(['multiple-callbacks.js'], 'client');
});

Package.on_test(function (api) {
  api.use(['tinytest@1.0.1', 'test-helpers@1.0.1', 'templating@1.0.5', 'xorax:multiple-callbacks@0.1.4'], 'client');
  api.add_files('multiple-callbacks-test.html', 'client');
  api.add_files('multiple-callbacks-test.js', 'client');
});
