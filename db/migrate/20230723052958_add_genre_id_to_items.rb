class AddGenreIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :genre, foreign_key: true
  end
end
