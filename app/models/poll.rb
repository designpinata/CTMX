class Poll < ApplicationRecord
  acts_as_taggable_on :travel_preferences

  validate :travel_preference_list_inclusion

  def travel_preference_list_inclusion
    travel_preference_list.each do |tag|
      errors.add(tag, "no es un valor válido") unless ["aire libre", "museos", "festivales", "comida"].include?(tag)
    end
  end
end
