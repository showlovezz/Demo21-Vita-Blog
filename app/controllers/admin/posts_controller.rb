class Admin::PostsController < ApplicationController

	# 在後台登入做驗證是否為管理者
	before_action :authenticate_admin

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "The Post successfully created"
			redirect_to admin_posts_path
		else
			flash[:alert] = "The Post was failed to create"
			render 'new'
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

end
