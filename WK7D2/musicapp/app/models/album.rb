class Album < ApplicationRecord
    validates :band_id, presence: true
    
    belongs_to :band, class_name: :Band, foreign_key: :band_id
end