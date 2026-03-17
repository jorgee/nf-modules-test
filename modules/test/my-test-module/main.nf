process TEST {
	input:
		val(id)
		tuple val(meta), path(text)
		path(reads)
	output:
		tuple val(meta), path("*.txt"), emit: txt
                val(id), emit: id
        script:
	"""
	cat $text >> out-${id}.txt
	"""
}
