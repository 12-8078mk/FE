class Infomation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  belongs_to :infomation
end
