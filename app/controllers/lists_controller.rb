class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  # def new
  #   @list = List.new
  # end

  def create
    @list = List.new(list_params)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
