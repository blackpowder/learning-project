class ChangeProjectTimeType < ActiveRecord::Migration
  def change
    change_column :projects, :time_project, :string
  end
end
