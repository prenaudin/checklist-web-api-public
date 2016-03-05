class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.all { head :not_found }
    end
  end
end
