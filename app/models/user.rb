class User < ActiveRecord::Base
  before_save      :default_name
  after_initialize :default_values
  has_secure_password

  validates :email, uniqueness: true,
                    presence: true,
                    email_format: { message: "Please enter a vaild email address" }
  validates :name,  presence:   true

  has_many :comics
  has_many :favorites,       dependent:   :destroy
  has_many :favorite_comics, through:     :favorites,
                             source:      :favorited,
                             source_type: "Comic",
                             dependent:   :destroy

  private
    def default_values
      self.admin ||= false
    end

    def default_name
      self.name ||= "Reader"
    end
end
