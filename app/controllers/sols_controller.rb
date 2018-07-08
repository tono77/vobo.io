class SolsController < ApplicationController
  before_action :set_sol, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /sols
  # GET /sols.json
  def index
    @sols = Sol.all
  end

  # GET /sols/1
  # GET /sols/1.json
  def show
  end

  # GET /sols/new
  def new
    @sol = Sol.new
  end

  # GET /sols/1/edit
  def edit
  end

  # POST /sols
  # POST /sols.json
  def create
    @sol = Sol.new(sol_params)

    respond_to do |format|
      if @sol.save
        format.html { redirect_to @sol, notice: 'Sol was successfully created.' }
        format.json { render :show, status: :created, location: @sol }
      else
        format.html { render :new }
        format.json { render json: @sol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sols/1
  # PATCH/PUT /sols/1.json
  def update
    respond_to do |format|
      if @sol.update(sol_params)
        format.html { redirect_to @sol, notice: 'Sol was successfully updated.' }
        format.json { render :show, status: :ok, location: @sol }
      else
        format.html { render :edit }
        format.json { render json: @sol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sols/1
  # DELETE /sols/1.json
  def destroy
    @sol.destroy
    respond_to do |format|
      format.html { redirect_to sols_url, notice: 'Sol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sol
      @sol = Sol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sol_params
      params.require(:sol).permit(:title, :desc, :user_id, :state_id)
    end
end