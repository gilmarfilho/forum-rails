class AddViewLikeDislikeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :views, :integer, default: 0
    add_column :posts, :likes, :integer, default: 0
    add_column :posts, :dislikes, :integer, default: 0
  end
end
