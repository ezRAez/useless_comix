class User < ActiveRecord::Base
  after_initialize :default_values

  validates :email, uniqueness: true, presence: true

  has_many :comics

  has_many :favorites
  has_many :favorite_comics, through: :favorites, source: :favorited, source_type: "Comic"

  has_secure_password

  private

  def default_values
    self.admin ||= false
  end
end
