class Admin::PostsController < ApplicationController

	# 在後台登入做驗證是否為管理者
	before_action :authenticate_admin
	before_action :find_post, only: [:show, :edit, :update, :destroy]

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

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "The Post was successfully updated"
			redirect_to admin_post_path(@post)
		else
			flash.now[:alert] = "The Post was failed to update"
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to admin_posts_path
		flash[:alert] = "The Post was deleted"
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
