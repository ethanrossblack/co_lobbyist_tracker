class LobbyistsController < ApplicationController
  before_action :set_lobbyist, only: [:show]
  
  def index
    @lobbyists = Lobbyist.where(status: "Current")
  end

  def show
  end

  private

  def set_lobbyist
    @lobbyist = Lobbyist.find(params[:id])
  end
end