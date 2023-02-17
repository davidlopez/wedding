class Invite < ApplicationRecord
  has_many :rsvps
  before_create :set_code

  def set_code
    return if self.code
    begin
      self.code = SecureRandom.hex.upcase[0..5]
    end until(Invite.find_by(code: self.code).nil?)
  end
end
