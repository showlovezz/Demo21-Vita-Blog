class Admin::PortfoliosController < ApplicationController

	def index
		@portfolios = Portfolio.all
	end

	def new
		@portfolio = Portfolio.new
	end
	
end
