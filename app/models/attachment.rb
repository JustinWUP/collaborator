class Attachment < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :attachment
 has_attached_file :attachment,
                    :storage => :Dropboxstorage,
                    :path => "/Collaborator/:attachment/:id/:style/:filename",
                    :default_url => "none"
end
