class Enabled < ApplicationRecord
  before_validation :set_defaults
  belongs_to :feature
  
  private

  def set_defaults
    name = "enabled" if name.blank?
    enabled = false if enabled.nil?
  end
end
