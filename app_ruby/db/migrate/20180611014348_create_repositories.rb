class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :user
      t.string :repository
      t.string :url
      t.string :language

      t.timestamps
    end
  end
end
