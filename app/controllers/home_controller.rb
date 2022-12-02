# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @link = Link.new
    @links = Link.where(user: current_user).order(id: :DESC) if current_user
    @links = session['hashes'] unless current_user
  end
end
