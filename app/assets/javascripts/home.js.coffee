
# Pattern for safe unicode encoding
# https://developer.mozilla.org/en-US/docs/Web/JavaScript/Base64_encoding_and_decoding#The_.22Unicode_Problem.22
window.encode = (str) -> btoa unescape encodeURIComponent str
window.decode = (str) -> decodeURIComponent escape atob str

$ ->
	analysisBar = $ '#analysis-bar'
	results = $ '#results'
	analyzeButton = analysisBar.find('form button')
	urlInput = analysisBar.find('input')
	token = $('meta[name="csrf-token"]').attr('content')
	analysisBar.find('form').submit ->
		url = urlInput.val().trim()
		if !url
			urlInput.val('').focus()
			return false
		history.replaceState null, null, encode(url)
		results.slideUp()
		analyzeButton.html('<i class="icon-gear icon-spin icon-large"></i>')
		results.load '/analyze', {url: urlInput.val(), authenticity_token: token}, ->
			results.slideDown()
			analyzeButton.html('Analyze')
		urlInput.blur()
		return false

	urlInput.focus()

	startingUrl = location.pathname.replace('/','')
	if !!startingUrl.trim()
		results.hide()
		console.log startingUrl
		urlInput.val decode startingUrl
		analysisBar.find('form').submit()
