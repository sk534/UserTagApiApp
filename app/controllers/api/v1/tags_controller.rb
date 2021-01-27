class Api::V1::TagsController < Api::V1::ApiController
	before_action :check_token
	def index
		@tags = Tag.active
  	render :json=>{ :status=> true , :tags=> @tags }
	end

	def create_tag
		tag = Tag.new
		user = User.find_by(username:params[:username])
		if user.present?
			tag.name=params[:name]
			tag.user_id=user.id
			tag.save
			render json: tag, status: :ok
		else
			render :json=>{ :status=> false , :msg=>"Invalid Request" }
		end
	end

	def update_tag
		tag = Tag.find_by(name:params[:name])
		user = User.find_by(username:params[:username])
		if user.present? && tag.present?
			tag.name=params[:new]
			tag.save
			render json: tag, status: :ok
		else
			render :json=>{ :status=> false , :msg=>"Invalid Request" }
		end
	end

	def delete_tag
		tag = Tag.find_by(name:params[:name])
		user = User.find_by(username:params[:username])
		if user.present? && tag.present?
			tag.destroy
			render :json=>{ :status=> true , :msg=>"Tag deleted successfully" }
		else
			render :json=>{ :status=> false , :msg=>"Invalid Request" }
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
