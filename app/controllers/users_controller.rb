class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, except: [:index, :new, :index_json, :create, :manage]
  # before_action :logged_in, only: [:show]
  # before_action :correct_user, only: :show
  
  def new
    @user=User.new
  end

  def show
     @user =  User.find(params[:id])
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      #@user.create_salary
      #@user.create_performance
      redirect_to root_path, flash: {success: "添加成功"}
    else
      flash[:warning] = "账号信息填写有误,请重试"
      redirect_to new_user_path
    end
  end

  def update
    if current_user.role!=5
      if @user.update_attributes(user_params)
        flash={:info => "更新成功"}
      else
        flash={:warning => "更新失败"}
      end
    else
      if @user.update_attributes(user_params1)
        flash={:info => "更新成功"}
      else
        flash={:warning => "更新失败"}
      end
    end
    redirect_to user_path, flash: flash
  end

  def destroy
    @user.destroy
    redirect_to user_manage_path(current_user), flash: {success: "用户删除"}
  end
  
  def manage
      @users=User.search(params).paginate(:page => params[:page], :per_page => 1000)
  end

  def index
    
    @users=User.search(params).paginate(:page => params[:page], :per_page => 10)
  end

  def index_json
    @users=User.search_friends(params, current_user)
    render json: @users.as_json
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :sex, :department_id, :password, :password_confirmation,
                                 :phonenumber, :status)
  end
  def user_params1
    params.require(:user).permit(:name, :email, :sex, :department_id, :password, :password_confirmation,
                                 :phonenumber, :status, :role)
  end

# Confirms a logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def correct_user
    unless current_user == @user or current_user.role == 5
      redirect_to chat_path(current_user), flash: {:danger => '您没有权限浏览他人信息'}
    end
  end

  def set_user
    @user=User.find_by_id(params[:id])
    if @user.nil?
      redirect_to root_path, flash: {:danger => '没有找到此用户'}
    end
  end

end
