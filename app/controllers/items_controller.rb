class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:edit, :update, :destroy, :toggle_checked]

  def create
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to @list, notice: "Item was successfully added."
    else
      redirect_to @list, alert: "Failed to add item."
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @list, notice: "Item was successfully updated."
    else
      render :edit, alert: "Failed to update item."
    end
  end

  def destroy
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to @list, notice: "Item was successfully deleted."
  end

  def toggle_checked
    @item.update(checked: !@item.checked)
    redirect_to list_path(@list), notice: "Item was successfully updated."
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :checked)
  end
end
