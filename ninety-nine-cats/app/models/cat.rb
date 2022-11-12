# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'
require 'action_view/helpers'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ['black', 'white', 'grey', 'chocolate', 'cream']

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS }
    validates :sex, inclusion: {in: %w(M F)}
    validate :birth_date_cannot_be_future


    def birth_date_cannot_be_future
        parsed = DateTime.parse(birth_date.to_s)
        yr = parsed.year
        month = parsed.month
        day = parsed.day

        if Date.today < birth_date
            errors.add(:birth_date, "cannot be in the future...")
        elsif !Date.valid_date?(yr, month, day)
            errors.add(:birth_date, "invalid date...")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end


end
