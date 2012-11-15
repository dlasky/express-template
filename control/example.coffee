
module.exports.index = (req, res) ->
	res.render 'index'
	
module.exports.item = (req, res) ->
	res.render 'index', locals: req.example