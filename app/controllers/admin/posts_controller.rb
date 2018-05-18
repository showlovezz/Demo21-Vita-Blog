class Admin::PostsController < ApplicationController

	# 在後台登入做驗證是否為管理者
	before_action :authenticate_admin

	def index
		@posts = Post.all
	end

end
