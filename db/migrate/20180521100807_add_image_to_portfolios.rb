class AddImageToPortfolios < ActiveRecord::Migration[5.1]
  def change
  	add_column :portfolios, :image, :string
  end
end
