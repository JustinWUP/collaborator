class Attachment < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :attachment
 has_attached_file :attachment,
                    :storage => :Dropboxstorage,
                    :path => "/Collaborator/:attachment/:id/:style/:filename",
                    :default_url => "none"
  validates_attachment_content_type :attachment, :content_type => ["image/png", "image/jpeg", "image/gif", "application/pdf"]
  validates_attachment_size :attachment, :less_than=>10.megabyte
end
