class CreateChallengesController < ApplicationController
  before_action :set_create_challenge, only: %i[ show edit update destroy ]

  # GET /create_challenges or /create_challenges.json
  def index
    @create_challenges = CreateChallenge.all
  end

  # GET /create_challenges/1 or /create_challenges/1.json
  def show
  end

  # GET /create_challenges/new
  def new
    @create_challenge = CreateChallenge.new
  end

  # GET /create_challenges/1/edit
  def edit
  end

  # POST /create_challenges or /create_challenges.json
  def create
    @create_challenge = CreateChallenge.new(create_challenge_params)

    respond_to do |format|
      if @create_challenge.save
        format.html { redirect_to @create_challenge, notice: "Create challenge was successfully created." }
        format.json { render :show, status: :created, location: @create_challenge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_challenges/1 or /create_challenges/1.json
  def update
    respond_to do |format|
      if @create_challenge.update(create_challenge_params)
        format.html { redirect_to @create_challenge, notice: "Create challenge was successfully updated." }
        format.json { render :show, status: :ok, location: @create_challenge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_challenges/1 or /create_challenges/1.json
  def destroy
    @create_challenge.destroy
    respond_to do |format|
      format.html { redirect_to create_challenges_url, notice: "Create challenge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_challenge
      @create_challenge = CreateChallenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_challenge_params
      params.require(:create_challenge).permit(:title, :description, :tags, :user_id)
    end
end
