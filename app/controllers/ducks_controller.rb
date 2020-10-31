class DucksController < ApplicationController

  def index
    @ducks = Duck.all
    render :index
  end

  def show
    @duck = Duck.find(params[:id])
    render :show
  end

  def new
    @duck = Duck.new
    render :new
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:duck_errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def edit
    @duck = Duck.find(params[:id])
    render :edit
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      flash[:duck_errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
