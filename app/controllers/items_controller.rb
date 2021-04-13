class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :incremental_search, :sort]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :move_action, only:[:edit, :update, :destroy]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    if @item.sales_record.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    if params[:keyword] != ""
      items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
      @items = items.order("created_at DESC")
      @keyword = params[:keyword]
    else
      items = Item.all
      @items = items.order("created_at DESC")
    end
  end

  def incremental_search
    items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    render json:{keyword: items}
  end

  def sort
    items = Item.where('name LIKE(?)', "%#{params[:item][:keyword]}%")
    @keyword = params[:item][:keyword]
    case params[:item][:sort]
      when "new"
        @items = items.order("created_at DESC")
      when "old"
        @items = items.order("created_at ASC")
      when "low"
        @items = items.order("price ASC")
      when "expensive"
        @items = items.order("price DESC")
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :prefectures_id, :term_to_send_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_action
    unless current_user.id == Item.find(params[:id]).user_id
      redirect_to action: :index
    end
  end
end
