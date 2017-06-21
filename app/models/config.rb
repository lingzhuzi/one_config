class Config < ApplicationRecord
  belongs_to :app
  belongs_to :env
end
