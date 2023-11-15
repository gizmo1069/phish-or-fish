class ScamsController < ApplicationController
  before_action :set_scam, only: [:edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  
  
  def show
    id = params[:id] # retrieve scam ID from URI route
    @scam = Scam.find(id) # look up scam by unique ID
    # will render app/views/scams/show.<extension> by default
  end

  def index
    @scams = Scam.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @scam = Scam.create!(scam_params.merge(user_id: current_user.id))
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

  def set_scam
    @scam = Scam.find(params[:id])
  end

  def check_owner
    unless current_user&.id == @scam.user_id
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to scams_path
    end
  end

  def scam_params
    params.require(:scam).permit(:title, :category, :zipcode, :description)
  end
end
