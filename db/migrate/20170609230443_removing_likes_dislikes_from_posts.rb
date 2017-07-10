class RemovingLikesDislikesFromPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :likes, :dislikes
    end
  end
end
