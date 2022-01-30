class AddAnonymousNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :anonymous_name, :string
  end
end
