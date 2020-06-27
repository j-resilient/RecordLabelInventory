# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  note       :text             not null
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
    validates :note, :user_id, :track_id, presence: true

    belongs_to :track,
        primary_key: :id,
        foreign_key: :track_id,
        class_name: :Track

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
