
$ -> $('#analysis-bar form').submit ->
	$('#results').load '/analyze', {url: $('#analysis-bar input').val(), authenticity_token: $('meta[name="csrf-token"]').attr('content')}
	return false