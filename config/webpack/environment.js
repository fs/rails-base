const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

const plugins = environment.plugins;

plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
);

module.exports = environment;
