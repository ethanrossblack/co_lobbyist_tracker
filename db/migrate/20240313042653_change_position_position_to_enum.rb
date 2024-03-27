class ChangePositionPositionToEnum < ActiveRecord::Migration[7.0]
  def up
    change_column :positions, :position, 'integer USING CAST(position AS integer)'
  end

  def down
    change_column :positions, :position, :string
  end
end

# Read about up/down here: https://guides.rubyonrails.org/active_record_migrations.html#making-the-irreversible-possible
