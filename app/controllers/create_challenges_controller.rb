class CreateChallengesController < ApplicationController
  before_action :set_create_challenge, only: %i[ show edit update destroy vote collaborate ]

  # GET /create_challenges or /create_challenges.json
  def index
    # @create_challenges = CreateChallenge.all
    @create_challenges = CreateChallenge.order(params[:sort])
    @create_challenge = CreateChallenge.new
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
        format.html { redirect_to root_path, notice: "Challenge was successfully created." }
        format.json { render :index, status: :created, location: @create_challenge }
      else
        format.html { redirect_to root_path }
        flash[:notice] = "Empty fields detected"
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

  # voting
  def vote
    if @create_challenge.user != current_user
      @validate = Vote.where({user_id: current_user.id, create_challenge_id: @create_challenge.id})
      if @validate.blank?
        @vote = Vote.new({:user_id => current_user.id, :create_challenge_id => @create_challenge.id})
        @vote.save
        @create_challenge.increment!(:vote_count)
        flash[:notice] = "Vote Recorded"
      else
        flash[:notice] = "Vote Already Recorded"
      end
    else
      flash[:notice] = "You can't upvote your own challenge"
    end
    respond_to do |f|
      f.html{ redirect_to root_path }
      f.json{ head :no_content }
    end
  end

  # collaboration
  def collaborate
    if @create_challenge.user != current_user
      @validate = Collaborate.where({user_id: current_user.id, create_challenge_id: @create_challenge.id})
      if @validate.blank?
        @collaborate = Collaborate.new({:user_id => current_user.id, :create_challenge_id => @create_challenge.id, :employee_id => current_user.user_id})
        @collaborate.save
        flash[:notice] = "You Can Contribute"
      else
        flash[:notice] = "Already A Contributor"
      end
    else
      flash[:notice] = "You can't be a contributor to your own challenge"
    end
    respond_to do |f|
      f.html{ redirect_to root_path }
      f.json{ head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_challenge
      @create_challenge = CreateChallenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_challenge_params
      params.require(:create_challenge).permit(:title, :description, :tags, :user_id, :employee_id)
    end
end
