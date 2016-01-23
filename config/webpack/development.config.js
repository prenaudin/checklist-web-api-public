var webpack = require('webpack');
var _ = require('lodash');
var path = require('path');
var config = module.exports = require('./main.config.js');

config = _.merge(config, {
  debug: true,
  displayErrorDetails: true,
  outputPathinfo: true,
  devtool: 'sourcemap',

  entry: [
    './app/frontend/javascripts/index.js',
    './app/frontend/stylesheets/application.sass',
  ],

  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        loaders: [
          'babel?presets[]=react,presets[]=es2015'
        ]
      },
      {
        test: /\.sass$/,
        loader: 'style!css!sass'
      }
    ]
  }
});

config.plugins.push(new webpack.NoErrorsPlugin());
