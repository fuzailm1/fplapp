class FixturesController < ApplicationController

  def index
    fixtures = []
    Fixture.all.each do |fixture|
      fixtures.push(fixture.opp_short_name)
    end
    return fixtures
  end
end
