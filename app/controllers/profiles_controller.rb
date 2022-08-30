class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @crag = @profile.crag
  end

  def new
    @profile = Profile.new
    @crag = Crag.new
  end

  def create
    @profile = Profile.new(profile_params)
    @crag = @profile.crag
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    @crag = @profile.crag
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :crag)
  end
end
