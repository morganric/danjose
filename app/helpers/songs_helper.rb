module SongsHelper

def embedly

	embedly_api = Embedly::API.new :key => 'de58199a853c4012893443678819d1f0', :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
	url = @song.url
	obj = embedly_api.oembed :url => url
	@song.embed_code = obj[0].html
end

end
