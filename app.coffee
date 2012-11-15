express = require 'express'
path = require 'path'
mongoose = require 'mongoose'

app = express()

app.configure( ->
	app.set 'port', process.env.PORT || 3000
	app.set 'db', process.env.DB || 'mongodb://localhost/express'

	app.set 'view engine', 'html'
	app.set 'layout', 'layout'

	#app.enable 'view cache'
	#app.set 'partials', {}

	app.engine 'html', require 'hogan-express'
	app.set 'views', path.join __dirname, 'views'

	#app.use express.compress()
	app.use express.bodyParser()
	app.use app.router
	app.use express.static path.join __dirname, 'static' 
)

app.configure('development', ->
	
	app.use( express.logger 'dev' )
	app.use( express.errorHandler {dumpExceptions: true, showStack: true} )

)

app.configure('production', ->
	app.use(express.logger())
	app.use(express.errorHandler())
)

mongoose.connect(app.get('db'))
require './model'
require('./route')(app)

app.listen( app.get 'port' )