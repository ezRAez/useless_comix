class Comic < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def next
    return nil unless self.id != Comic.last.id
    Comic.where( "created_at > ?", self.created_at )
         .order( "created_at" )
         .first
  end

  def prev
    return nil unless self.id != Comic.first.id
    Comic.where( "created_at < ?", self.created_at )
         .order( "created_at DESC" )
         .first
  end
end
