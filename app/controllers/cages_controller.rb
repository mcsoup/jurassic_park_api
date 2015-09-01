class CagesController < ApplicationController
  before_action :set_cage, only: [:show, :edit, :update, :destroy]

  def index
    respond_with Cage.search(params[:q]).result
  end

  def show
    respond_with @cage
  end

  def create
    @cage = Cage.new(cage_params)

    if @cage.save
      respond_with @cage
    else
      render json: @cage.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cage.update(cage_params)
      head :no_content
    else
      render json: @cage.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @cage.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cage
      @cage = Cage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cage_params
      params.require(:cage).permit(:max_capacity, :power, :contained)
    end
end
