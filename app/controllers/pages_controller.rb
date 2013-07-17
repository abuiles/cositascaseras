class PagesController < ApplicationController
  def landing
    @stores = Store.all
    mixpanel.append_track("Home Page Visit")
  end

  def about
  end
end
