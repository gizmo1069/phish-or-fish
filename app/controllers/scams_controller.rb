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
    @all_categories = Scam.all_categories
    @scams = Scam.with_categories(categories_list)
    @categories_to_show_hash = categories_hash
    session['categories'] = categories_list
  end

  def new
    # default: render 'new' template
  end

  def my_posts
    @user = current_user
    @my_posts = Scam.where(user_id: @user.id)
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

  def categories_list
    params[:categories]&.keys || session[:categories] || Scam.all_categories
  end

  def categories_hash
    Hash[categories_list.collect { |item| [item, "1"] }]
  end

  def scam_params
    params.require(:scam).permit(:title, :category, :zipcode, :description, :url)
  end
end
