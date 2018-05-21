class Admin::PortfoliosController < ApplicationController

	before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

	def index
		@portfolios = Portfolio.all
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)
		if @portfolio.save
			flash[:notice] = "作品建立成功"
			redirect_to admin_portfolios_path
		else
			flash[:alert] = "少輸入什麼，作品建立不成功"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @portfolio.update(portfolio_params)
			flash[:notice] = "作品修改成功"
			redirect_to admin_portfolios_path
		else
			flash[:alert] = "少輸入什麼，作品修改不成功"
			render 'edit'
		end
	end
	def destroy
		@portfolio.destroy
		flash[:alert] = "作品被刪除了"
		redirect_to admin_portfolios_path
	end


	private

	def portfolio_params
		params.require(:portfolio).permit(:title, :content, :image)
	end

	def find_portfolio
		@portfolio = Portfolio.find(params[:id])
	end
	
end
