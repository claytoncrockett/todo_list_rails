class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
 
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
  
    if @list.update(list@list_params)
      redirect_to list@lists_path
    else
      render :edit
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path
  end
 
  private
 
    def lists_params
      params.require(:list).permit(:title, :category)
    end
end
