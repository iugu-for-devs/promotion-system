class PromotionApproval < ApplicationRecord
  belongs_to :promotion
  belongs_to :user
end
