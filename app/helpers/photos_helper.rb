module PhotosHelper

	def embedly_photo

	embedly_api = Embedly::API.new :key => 'de58199a853c4012893443678819d1f0', :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
	url = @photo.song_url
	obj = embedly_api.oembed :url => url
	@photo.thumbnail =  obj[0].thumbnail_url
	@photo.embed_code = obj[0].html
	end

	def guess

	end
end
