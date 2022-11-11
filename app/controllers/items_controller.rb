class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :user_signed, only: [:edit,:destroy]



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
  
  

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
      else
      render :edit
    end
  end

  def destroy
    if @item.destroy
    redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit( :image, :name, :introduction, :category_id, :item_condition_id, :charge_id, :address_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_signed
    unless @item.user_id == current_user.id && @item.purchase.nil?
      redirect_to root_path
    end
  end
end
