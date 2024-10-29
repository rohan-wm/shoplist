class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists
  end

  def show
    @items = @list.items
  end


  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      current_user.user_lists.create(list: @list)
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "List was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: "List was successfully deleted."
  end

  private

  def set_list
    @list = current_user.lists.find_by(id: params[:id])
    if @list.nil?
      flash[:alert] = 'List not found.'
      redirect_to lists_path
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
