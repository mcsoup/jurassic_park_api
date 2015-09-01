class DinosaursController < ApplicationController
  before_action :set_dinosaur, only: [:show, :edit, :update, :destroy]

  def index
    @dinosaurs = params[:cage_id] ? Cage.find(params[:cage_id]).dinosaurs : Dinosaur.all
    respond_with @dinosaurs.search(params[:q]).result
  end

  def show
    respond_with @dinosaur
  end

  def create
    @dinosaur = Dinosaur.new dinosaur_params
    if @dinosaur.save
      respond_with @dinosaur
    else
      render json: @dinosaur.errors
    end
  end

  def update
    if @dinosaur.update(dinosaur_params)
      head :no_content
    else
      render json: @dinosaur.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @dinosaur.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinosaur
      @dinosaur = Dinosaur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinosaur_params
      if params[:dinosaur][:species]
        if params[:dinosaur][:diet]
          @species = Species.find_or_create_by(species_params)
        else
          @species = Species.find(params[:dinosaur][:species])
        end
        params[:dinosaur][:species_id] = @species.id
      end
      params.require(:dinosaur).permit(:name, :diet, :cage_id, :species_id)
    end

    def species_params
      {diet: params[:dinosaur][:diet], label:params[:dinosaur][:species]} 
    end
end
