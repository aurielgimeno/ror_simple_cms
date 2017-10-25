class AdminUsersController < ApplicationController

	layout 'admin'
	
  before_action :confirm_logged_in

  def index
  	@admin_users = AdminUser.sorted
  end

  def new
  	@admin_user = AdminUser.new()
  end

  def create
  	@admin_user = AdminUser.new(admin_user_params)
  	if @admin_user.save
  		flash[:notice] = "Admin User created successfully"
  		# redirect_to(admin_user_path(@admin_user))
  		redirect_to(admin_users_path)
  	else
  		flash[:notice] = "Error in saving"
  		render("new")
  	end
  end

  def edit
  	@admin_user = AdminUser.find(params[:id])
  end

  def update
  	@admin_user = AdminUser.find(params[:id])
  	if @admin_user.update_attributes(admin_user_params)
  		flash[:notice] = "Admin User update successfully"
  		# redirect_to(admin_user_path(@admin_user))
  		render("edit")
  	else
  		flash[:notice] = "Error in updating"
  		render("edit")
  	end
  end

  def delete
  	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
  	@admin_user = AdminUser.find(params[:id])
  	if @admin_user.destroy
  		flash[:notice] = "#{@admin_user.username} destroyed successfully"
  		redirect_to(admin_users_path)
  	else
  		flash[:notice] = "Error in destroying"
  		render("delete")
  	end
  end

  private

  def admin_user_params
  	params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end
