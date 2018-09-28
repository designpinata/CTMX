class Tip < ApplicationRecord
  belongs_to :totem

  scope :approved, -> { where(approved: true) }

  def status
    self.approved ? "Aprobado" : "No aprobado"
  end
end
