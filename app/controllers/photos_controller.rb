class PhotosController < ApplicationController
  include PhotosHelper

  load_and_authorize_resource
  skip_authorize_resource :only => [:index,:show]
  # GET /photos
  # GET /photos.json
  def index

    if current_user
      if current_user.has_role? :admin
        @photos = Photo.order('created_at DESC').page(params[:page]).per(6) 
      end
    else
      @photos = Photo.where(:published => true).order('created_at DESC').page(params[:page]).per(6)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.json { render json: @photos }
    end
  end

  def admin
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    @options = Array.new
    @options << @photo
    ops = Photo.where("id != ?", @photo.id) 
    c = ops.count
    @options << ops.find(:first, :offset => rand(c)) 
    @options << ops.find(:first, :offset => rand(c))
    @options.shuffle!

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  def tracks
    @tracks = Photo.order("song_title   ").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tracks }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    url = @photo.song_url
    embedly_photo(url) 
    @photo.user = current_user

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    # url = @photo.song_url
    url = params[:photo][:song_url]
    embedly_photo(url)
    
    @photo.save

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
