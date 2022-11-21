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
    @pig = Pig.new(params[:pig_params])
    if @pig.save
      redirect_to pig_path(@pig), status: :see_other
    else
      render new_pig_path, status: :unprocessable_entity
    end
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
    redirect_to pigs_path, status: :see_other
  end

  private

  def pig_params
    params.require(:pig).permit(:name, :age, :details, :breed, :price, :user_id)
  end
end
