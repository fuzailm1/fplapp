class ApplicationController < ActionController::Base

  def get_all_players
    # http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
    require 'open-uri'
    # https://github.com/flori/json
    require 'json'
    # http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
    require 'pp'
    url = "https://fantasy.premierleague.com/drf/bootstrap-static"
    buffer = open(url).read
    @result = JSON.parse(buffer)
  end

end
