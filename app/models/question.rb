class Question < ApplicationRecord
	belongs_to :questionnaire


	validates :content, :presence => true, :on => :create
	validates :answer, :presence => true, :on => :create
end
