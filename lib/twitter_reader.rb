# NOTE: This file is following the examples given at https://github.com/jnunemaker/twitter

require 'twitter'
require_relative 'credentials'

# Return @sferik's location
puts Twitter.user("sferik").location

# Return @sferik's most recent tweet
puts Twitter.user_timeline("sferik").first.text

#Return the text of the Tweet at https://twitter.com/sferik/statuses/27558893223
puts Twitter.status(27558893223).text

# Find the 3 most recent marriage proposals to @justinbieber
  Twitter.search("to:justinbieber marry me", :rpp => 3, :result_type => "recent").map do |status|
    puts "#{status.from_user}: #{status.text}"
  end

# Find a Japanese-language Tweet tagged #ruby (no retweets)
puts Twitter.search("#ruby -rt", :lang => "ja", :rpp => 1).first.text

Twitter.configure do |config|
  credentials = Credentials.new
  config.consumer_key = credentials.consumer_key
  config.consumer_secret = credentials.consumer_secret
  config.oauth_token = credentials.oauth_token
  config.oauth_token_secret = credentials.oauth_token_secret

# Twitter.update("Success!")

puts Twitter.home_timeline.first.text

puts Twitter.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour"
end
