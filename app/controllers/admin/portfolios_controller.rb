class Admin::PortfoliosController < ApplicationController

	before_action :find_portfolio, only: [:show]

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

	private

	def portfolio_params
		params.require(:portfolio).permit(:title, :content, :image)
	end

	def find_portfolio
		@portfolio = Portfolio.find(params[:id])
	end
	
end
