mongoose = require 'mongoose'

example = require './example'

module.exports = (app) ->
	
	app.get '/', (req, res) ->
		res.render 'index'
	
	#child routes	
	example(app)	