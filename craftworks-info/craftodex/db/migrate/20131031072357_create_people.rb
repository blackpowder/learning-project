class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :grade
      t.string :role
      t.text :introduction
      t.text :biography
      t.text :goals
      t.text :learning_goals
      t.text :teach
      t.string :linked_in
      t.string :yammer
      t.string :github
      t.string :email

      t.timestamps
    end
  end
end
