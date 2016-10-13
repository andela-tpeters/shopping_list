class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :shopping_list
      t.string :task
      t.timestamps
    end
  end
end
