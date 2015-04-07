class AddAuthorToBlogPost < ActiveRecord::Migration
  def change
    add_column :refinery_blog_posts, :authors, :string
  end
end
