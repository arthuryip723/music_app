class ModifyTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :category, :string
  end
end
