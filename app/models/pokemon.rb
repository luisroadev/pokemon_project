class Pokemon < ApplicationRecord

	validates :name, :presence => true, :uniqueness => true
	validates :type_1, :total, :hp, :attack, :defense,
	          :sp_atk, :sp_def, :speed, :generation, presence: true
	validates :legendary, :inclusion => {:in => [true, false]}
end
