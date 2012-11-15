mongoose = require 'mongoose'
Schema = mongoose.Schema

ExampleSchema = new Schema {
	name : String
	example: Number
}

mongoose.model 'example', ExampleSchema