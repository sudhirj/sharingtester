
$ -> $('#analysis-bar form').submit ->
	$('#results').slideUp()
	$('#results').load '/analyze', {url: $('#analysis-bar input').val(), authenticity_token: $('meta[name="csrf-token"]').attr('content')}, -> $('#results').slideDown()
	$('#analysis-bar input').blur()
	return false

$ -> $('#analysis-bar input').focus()