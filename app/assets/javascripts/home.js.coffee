spinner = new Spinner()

$ -> $('#analysis-bar form').submit ->
	$('#results').slideUp()
	$('#analysis-bar form button').html('<i class="icon-gear icon-spin icon-large"></i>')
	$('#results').load '/analyze', {url: $('#analysis-bar input').val(), authenticity_token: $('meta[name="csrf-token"]').attr('content')}, ->
		$('#results').slideDown()
		$('#analysis-bar form button').html('Analyze')
	$('#analysis-bar input').blur()
	return false

$ -> $('#analysis-bar input').focus()