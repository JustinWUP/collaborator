module ParentResource
  def parent_resource(resource)
    cattr_accessor :parent_resource_class
    self.parent_resource_class = resource.to_s.classify.constantize
    include InstanceMethods
  end

  module InstanceMethods
    def parent_resource
      self.class.parent_resource_class
    end
  end
end

ActiveRecord::Base.extend ParentResource