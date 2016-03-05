var webpack = require('webpack');
var _ = require('lodash');
var path = require('path');
var config = module.exports = require('./main.config.js');

config = _.merge(config, {
  debug: true,
  displayErrorDetails: true,
  outputPathinfo: true,
  devtool: 'sourcemap'
});

config.plugins.push(new webpack.NoErrorsPlugin());
