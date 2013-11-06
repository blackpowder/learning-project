class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :team_number
      t.integer :time_project
      t.datetime :start_date
      t.datetime :end_date
      t.integer :budget_dollars
      t.integer :budget_FG
      t.text :FG_details
      t.text :short_description
      t.text :full_description

      t.timestamps
    end
  end
end
