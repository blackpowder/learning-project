ActiveAdmin.register Project do

  index do
    column :name
    default_actions
  end

  show do |project|
    attributes_table do
      row :name
      row :team_number
      row :time_project
      row :start_date
      row :end_date
      row :budget_dollars
      row :budget_FG
      row :FG_details
      row :short_description
      row :full_description
      row "people" do |project|
        project.people.collect {|p| link_to( p.name, admin_person_path(p))}.join(', ').html_safe
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :team_number
      f.input :time_project
      f.input :start_date
      f.input :end_date
      f.input :budget_dollars
      f.input :budget_FG
      f.input :FG_details
      f.input :short_description
      f.input :full_description
      f.input :people, as: :check_boxes, collection: Person.all
    end
    f.actions
  end

end
