class Product < ApplicationRecord
    belongs_to :producer
    has_and_belongs_to_many :categories
  
    validates :name, presence: true, length: { maximum: 32 }
    validates :full_name, presence: true, length: { maximum: 256 }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true
    validates :production_date, presence: true
    validates :guarantee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :producer_id, presence: true, numericality: { only_integer: true }
    validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  
    validate :producer_exists
  
    private
  
    def producer_exists
      errors.add(:producer_id, "Producer must exist") unless Producer.exists?(producer_id)
    end
  end
  