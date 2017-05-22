class Index extends Base


	className = "IndexModel"


module.exports = new Index({
	schema: IndexSchema
	table: "indexes"
})
