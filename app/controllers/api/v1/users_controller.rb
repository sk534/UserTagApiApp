class Api::V1::UsersController < Api::V1::ApiController
  before_action :check_token
  def index	
    @users=User.active
    render json: @users, status: :ok
  end

  def create_user
    user=User.new
    user.first_name=params[:first_name]
    user.last_name=params[:last_name]
    user.email=params[:email]
    user.password=params[:password]
    user.password_confirmation=params[:password]
    user.username=params[:username]
    if params[:is_admin]=="false"
      user.save
    else
      user.authentication_token=Devise.friendly_token
      user.is_admin=true
      user.save
    end
    render json: user, status: :ok
  end

  def update		
    begin 
      if request.env["HTTP_USERNAME"].present?
        user = User.find_by(username:request.env["HTTP_USERNAME"])
        if user.email==params[:email]
          user.first_name=params[:first_name]
          user.last_name=params[:last_name]
          user.email=params[:email]
          user.password=params[:password]
          user.password_confirmation=params[:password]
          user.save
          render json: user, status: :ok
        else
          head(:unauthorized)
        end
      end
    rescue
      render :json=> { status: false }
    end
  end
		
  def deactivate_user
    begin 
      if params[:username].present?
        user = User.find_by(username:params[:username])
        user.is_active=false
        user.save
        user.tags.each do |tag|
          tag.is_active=false
          tag.save
        end
        render json: user, status: :ok		
      end
    rescue
      render :json=> { status: false }
    end
  end

  def delete_user
    begin 
      if params[:username].present?
        user = User.find_by(username:params[:username])
        user.destroy
        render json: user, status: :ok		
      end
    rescue
      render :json=> { status: false }
    end
  end

  private
  def check_token
    @token = request.env["HTTP_AUTHENTICATION_TOKEN"]
    if !@token.nil? && !@token.blank?
      return @token
    else
      head(:unauthorized)
    end
  end
end
