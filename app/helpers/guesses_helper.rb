module GuessesHelper

	def embedly_guess

		embedly_api = Embedly::API.new :key => 'de58199a853c4012893443678819d1f0', :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
		url = @guess.url
		obj = embedly_api.oembed :url => url
		@guess.embed_code = obj[0].html
	
	end

end
