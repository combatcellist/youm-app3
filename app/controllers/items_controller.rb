class ItemsController < ApplicationController

  before_action :find_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path, notice: "メニューが投稿されました"
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: "メニューが更新されました"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :content, images:[]).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
