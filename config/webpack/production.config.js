var webpack = require('webpack');
var _ = require('lodash');
var path = require('path');

var config = module.exports = require('./main.config.js');

config.output = _.merge(config.output, {
  path: path.join(config.context, 'public', 'assets'),
  filename: 'application-[hash].js',
});

config.plugins.push(
  new webpack.optimize.UglifyJsPlugin(),
  new webpack.optimize.OccurenceOrderPlugin()
);
