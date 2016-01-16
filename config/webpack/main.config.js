var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

var dist = path.join(__dirname, '../', '../');

var config = module.exports = {
  context: dist,
  entry: [
    './app/frontend/javascripts/index.js',
    './app/frontend/stylesheets/application.sass',
  ],

  resolve: {
    root: [
      path.join(dist, 'app', 'frontend', 'javascripts'),
      path.join(dist, 'app', 'frontend', 'stylesheets')
    ],
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx', '.sass', 'config.js'],
  },

  output: {
    path: path.join(dist, 'app', 'assets', 'javascripts'),
    filename: 'application.js',
    publicPath: 'http://0.0.0.0:8080/assets/'
  },

  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel?presets[]=react,presets[]=es2015'
      },
      {
        test: /\.sass$/,
        loader: ExtractTextPlugin.extract('style', 'css!sass')
      }
    ],
  },
  plugins: [
    new ExtractTextPlugin('application.css'),
    new webpack.ProvidePlugin({
      'Promise': 'es6-promise',
      'fetch': 'imports?this=>global!exports?global.fetch!whatwg-fetch'
    })
  ]
};
