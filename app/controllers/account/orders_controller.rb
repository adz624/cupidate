class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new
    if @order.save(order_params)
      redirect_to account_order_path(@order), notice: '創建 order 成功，請趕快付款'
    else
      render :new
    end
  end

  def index
    @orders = current_user.orders.all.page(params[:page])
  end


  protected

  def order_params
    params.require(:order).permit(:deposit_amount)
  end
end