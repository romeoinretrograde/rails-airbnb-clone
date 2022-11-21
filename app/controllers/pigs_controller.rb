class PigsController < ApplicationController

  def index
    @pigs = Pig.all
  end

  def show
    @pig = Pig.find(params[:id])
  end

  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(params[:pig])
    @pig.save
    rederict_to pig_path(@pig)
  end

  def edit
    @pig = Pig.find(params[:id])
  end

  def update
    @pig = Pig.find(params[:id])
    @pig.update(pigs_params)
    redirect_to pig_path(@pig)
  end

  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to pig_pth, status: :see_other
  end

  private

  def pig_params
    params.require(:pig).permit(:name, :age, :details, :breed, :price, :user_id)
  end
end
