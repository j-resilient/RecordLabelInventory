# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer
#  studio     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer
#
class Album < ApplicationRecord
    validates :title, :band_id, presence: true
    validates :studio, inclusion: { in: %w(true false) }

    belongs_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band
end
