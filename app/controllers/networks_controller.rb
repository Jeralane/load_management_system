class NetworksController < ApplicationController
  layout 'admin'

  def index
    @networks = Network.all.order(:name)
  end

  def show
    @network = Network.find(params[:id])
  end

  def new
    @network = Network.new
  end

  def edit
    @network = Network.find(params[:id])
  end

  def create
    @network = Network.new(network_params)
    if @network.save
      flash[:notice] = 'Network created.'
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @network = Network.find(params[:id])
    if @network.update(network_params)
      redirect_to networks_url, notice: 'Network was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @network = Network.find(params[:id])
    @network.destroy
    redirect_to networks_url, notice: 'Network was successfully deleted.'
  end

  private

  def network_params
    params.require(:network).permit(:name)
  end
end
