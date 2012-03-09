class AddRetainerExpirationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :retainer_expiration, :date

  end
end
