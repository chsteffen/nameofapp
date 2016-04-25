class CreateObjectNames < ActiveRecord::Migration
  def change
    create_table :object_names do |t|

      t.timestamps null: false
    end
  end
end
