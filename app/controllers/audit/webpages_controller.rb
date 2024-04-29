class Audit::WebpagesController < ApplicationController
  def new
    @webpage = Webpage.new
  end
end
