# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer          not null
#
class Track < ApplicationRecord
    validates :title, :ord, presence: true
    validates :bonus, inclusion: { in: [true, false], allow_nil: true }

    belongs_to :album,
        primary_key: :id,
        foreign_key: :album_id,
        class_name: :Album
end
