mongoose = require 'mongoose'
example = require '../control/example'
ExampleModel = mongoose.model 'example'

module.exports = (app) ->
	app.get '/example', example.index
	app.get '/example/:id', example.item
	
	app.param 'id', (req, res, next, id) ->
		ExampleModel.findOne({_id:id})
		.exec (err, exampleItem) ->
			return next err if err
			req.example = exampleItem
			next()
	
		