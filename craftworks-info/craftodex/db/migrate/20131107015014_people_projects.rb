class PeopleProjects < ActiveRecord::Migration
  def change
    create_join_table :people, :projects
  end
end
