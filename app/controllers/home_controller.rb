class HomeController < ApplicationController
  require 'feedzirra'



  def index
    @users = User.all
    # fetching a single feed
	feed = Feedzirra::Feed.fetch_and_parse("http://blog.emblzn.com/rss")
	feed.sanitize_entries!
	@entries = feed.entries
	@latest = feed.entries.first

  end

  def goodbye
  end
end
