var webpack = require('webpack');
var _ = require('lodash');
var path = require('path');
var config = module.exports = require('./main.config.js');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

config = _.merge(config, {
  debug: true,
  displayErrorDetails: true,
  outputPathinfo: true,
  devtool: 'sourcemap',

  entry: [
    'webpack-dev-server/client?http://0.0.0.0:8080',
    'webpack/hot/only-dev-server',
    './app/frontend/javascripts/app.js',
    './app/frontend/stylesheets/application.sass',
  ],

  module: {
    loaders: [
      { test: /\.jsx?$/, loaders: ['react-hot', 'babel?presets[]=react,presets[]=es2015'] },
      {
        test: /\.sass$/,
        loaders: [ 'react-hot', ExtractTextPlugin.extract('style', 'css!sass') ]
      }
    ]
  }
});

config.plugins.push(new webpack.HotModuleReplacementPlugin());
config.plugins.push(new webpack.NoErrorsPlugin());
