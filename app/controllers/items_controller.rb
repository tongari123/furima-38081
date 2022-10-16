class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
   @items = Item.includes(:user).order('created_at DESC')
end

  def new
  @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  


  private

  def item_params
    params.require(:item).permit( :image, :name, :introduction, :category_id, :item_condition_id, :charge_id, :address_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

 end
