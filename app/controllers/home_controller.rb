class HomeController < ApplicationController
  def index
    @links = Link.order(id: :DESC)
    @links = @links.where(user: current_user) if current_user
  end
end
