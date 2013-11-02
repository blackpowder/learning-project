class AddFieldsToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :job_title, :string
  	add_column :people, :city, :string
  end
end
