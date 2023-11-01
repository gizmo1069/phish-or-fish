class ScamsController < ApplicationController

  def show
    id = params[:id] # retrieve scam ID from URI route
    @scam = Scam.find(id) # look up scam by unique ID
    # will render app/views/scams/show.<extension> by default
  end

  def index
    @scams = Scam.includes(:user).all
  end

  def new
    # default: render 'new' template
  end

  def create
    @scam = Scam.create!(scam_params)
    flash[:notice] = "#{@scam.title} was successfully created."
    redirect_to scams_path
  end

  def edit
    @scam = Scam.find params[:id]
  end

  def update
    @scam = Scam.find params[:id]
    @scam.update_attributes!(scam_params)
    flash[:notice] = "#{@scam.title} was successfully updated."
    redirect_to scam_path(@scam)
  end

  def destroy
    @scam = Scam.find(params[:id])
    @scam.destroy
    flash[:notice] = "Scam '#{@scam.title}' deleted."
    redirect_to scams_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def scam_params
    params.require(:scam).permit(:title, :category, :zipcode, :description)
  end
end
