var webpack = require('webpack');
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin')
var extractApplicationStyle = new ExtractTextPlugin('../stylesheets/application.css');

var dist = path.join(__dirname, '../', '../');

module.exports = {
  context: dist,
  entry: [
    './app/frontend/javascripts/index.js',
    './app/frontend/stylesheets/application.scss',
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
  },

  module: {
    loaders: [
      {
        test: /\.js$/,
        loaders: [
          'babel?presets[]=react,presets[]=es2015'
        ]
      },
      {
        test: /\.scss$/,
        loader: extractApplicationStyle.extract(['css', 'sass'])
      }
    ]
  },

  plugins: [
    extractApplicationStyle,
    new webpack.optimize.UglifyJsPlugin(),
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.ProvidePlugin({
      'Promise': 'es6-promise',
      'fetch': 'imports?this=>global!exports?global.fetch!whatwg-fetch'
    })
  ]
};
