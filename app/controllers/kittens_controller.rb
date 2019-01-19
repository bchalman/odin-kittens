class KittensController < ApplicationController
before_action :set_kitten, only: [:show, :edit, :update]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json {render :json => @kittens}
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created"
      redirect_to @kitten
    else
      render 'new'
    end

  end

  def show
    respond_to do |format|
      format.html
      format.json {render :json => @kitten}
    end
  end

  def edit
  end

  def update
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Updated kitten"
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten deleted"
    redirect_to kittens_path
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

    def set_kitten
      @kitten = Kitten.find(params[:id])
    end
end
