class AddSocialLinksToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :linked_in_url, :string
  end
end
