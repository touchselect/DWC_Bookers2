const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack');

module.exports = {
	plugins: [
		new webpack.ProvidePlugin({
			$: 'jquery',
			jQuery: 'jquery',
			Popper: ['popper.js', 'default']
		})
	]
};