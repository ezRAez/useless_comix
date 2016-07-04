class User < ActiveRecord::Base
  after_initialize :default_values
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  has_many :comics
  has_many :favorites, dependent: :destroy
  has_many :favorite_comics, through: :favorites,
                             source: :favorited,
                             source_type: "Comic",
                             dependent: :destroy

  private
    def default_values
      self.admin ||= false
    end
end
