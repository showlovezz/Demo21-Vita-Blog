class Portfolio < ApplicationRecord

	# 這是carrierwave提供的方法
	mount_uploader :image, PhotoUploader

	# 驗證 title、content 及 image 欄位必填
	validates :title, :content, :image, presence: true

end
