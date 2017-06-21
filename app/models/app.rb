class App < ApplicationRecord
  has_many :configs, dependent: :destroy
end
