class SolsController < ApplicationController
  before_action :set_sol, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /sols
  # GET /sols.json
  def index

  end

  def current_vobos
    @sols = Sol
    .select('sols.id, sols.title,sols.desc, users.name, states.desc as estado, sols.created_at')
    .joins(:state, :user_two)
    .where(user_one_id:  current_user) 
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
    @sol = Sol.new(sol_params.except(:email))
    @sol.user_one_id = current_user.id
    @sol.state_id = 1

    if User.where(email: sol_params[:email]).exists?
      @sol.user_two_id = User.where(email: sol_params[:email]).take.id
      respond_to do |format|
      if @sol.save
        format.html { redirect_to @sol, notice: 'Sol successfully created.' }
        format.json { render :show, status: :created, location: @sol }
      else
        format.html { render :new }
        format.json { render json: @sol.errors, status: :unprocessable_entity }
      end
    end

    else
      User.invite!(:email => sol_params[:email], :name => "Estimado")
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
      @desc_est = @sol.state.desc
      @solicitante = @sol.user_one.name
      @aprobador = @sol.user_two.name
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sol_params
      params.require(:sol).permit(:title, :desc, :state_id, :user_one_id, :user_two_id, :email)
    end
end
