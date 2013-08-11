class GuessesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :update, :destroy]

  load_and_authorize_resource
  skip_authorize_resource :only => [:show,:create,:new,:destroy]

  # GET /guesses
  # GET /guesses.json
  def index
    @guesses = Guess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guesses }
    end
  end

  # GET /guesses/1
  # GET /guesses/1.json
  def show
    @guess = Guess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guess }
    end
  end

  # GET /guesses/new
  # GET /guesses/new.json
  def new
    if !anyone_signed_in?
      deny_access
    else

      @guess = Guess.new
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guess }
    end
  end

  # GET /guesses/1/edit
  def edit
    @guess = Guess.find(params[:id])
  end

  # POST /guesses
  # POST /guesses.json
  def create
    @guess = Guess.new(params[:guess])
    @post = Post.find(@guess.post_id)

    respond_to do |format|
      if @guess.save
        format.html { redirect_to @post, notice: 'Guess was successfully created.' }
        format.json { render json: @guess, status: :created, location: @guess }
      else
        format.html { render action: "new" }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guesses/1
  # PUT /guesses/1.json
  def update
    @guess = Guess.find(params[:id])

    respond_to do |format|
      if @guess.update_attributes(params[:guess])
        format.html { redirect_to @guess, notice: 'Guess was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guesses/1
  # DELETE /guesses/1.json
  def destroy
    @guess = Guess.find(params[:id])
    @guess.destroy

    respond_to do |format|
      format.html { redirect_to guesses_url }
      format.json { head :no_content }
    end
  end
end
