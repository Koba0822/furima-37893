class CreateActiveTables < ActiveRecord::Migration[6.0]
  def change
    create_table :active_tables do |t|

      t.timestamps
    end
  end
end
