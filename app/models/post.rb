class Post < ApplicationRecord

	# 驗證 title 及 content 欄位必填
	validates :title, :content, presence: true

end
