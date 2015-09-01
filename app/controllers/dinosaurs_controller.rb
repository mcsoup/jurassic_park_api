class DinosaursController < ApplicationController
  before_action :set_dinosaur, only: [:show, :edit, :update, :destroy]

  # GET /dinosaurs
  # GET /dinosaurs.json
  def index
    @dinosaurs = Dinosaur.all
  end

  # GET /dinosaurs/1
  # GET /dinosaurs/1.json
  def show
  end

  # GET /dinosaurs/new
  def new
    @dinosaur = Dinosaur.new
  end

  # GET /dinosaurs/1/edit
  def edit
  end

  # POST /dinosaurs
  # POST /dinosaurs.json
  def create
    @dinosaur = Dinosaur.new(dinosaur_params)

    respond_to do |format|
      if @dinosaur.save
        format.html { redirect_to @dinosaur, notice: 'Dinosaur was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dinosaur }
      else
        format.html { render action: 'new' }
        format.json { render json: @dinosaur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinosaurs/1
  # PATCH/PUT /dinosaurs/1.json
  def update
    respond_to do |format|
      if @dinosaur.update(dinosaur_params)
        format.html { redirect_to @dinosaur, notice: 'Dinosaur was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dinosaur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinosaurs/1
  # DELETE /dinosaurs/1.json
  def destroy
    @dinosaur.destroy
    respond_to do |format|
      format.html { redirect_to dinosaurs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinosaur
      @dinosaur = Dinosaur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinosaur_params
      params.require(:dinosaur).permit(:name, :species, :diet)
    end
end
