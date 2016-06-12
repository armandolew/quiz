class Questionnaire < ApplicationRecord
	has_many :questions, inverse_of: :questionnaire, :dependent => :destroy
	accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

	validates :title, :presence => true
end
