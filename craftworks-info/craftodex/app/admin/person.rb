ActiveAdmin.register Person do
  filter :name

  index do
    column :name
    default_actions
  end

  show do |person|
    attributes_table do
      row :name
      row :email
      row :city
      row :job_title
      row :grade
      row :role
      row "projects" do |person|
        (person.projects.map{ |p| link_to(p.name, admin_project_path(p)) }).join(', ').html_safe
      end
    end
    attributes_table do
      row :introduction
      row :biography
      row :goals
      row :learning_goals
      row :teach
    end
    attributes_table do
      row :linked_in
      row :yammer
      row :github
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :city
      f.input :job_title
      f.input :grade
      f.input :role
    end

    f.inputs "Story" do
      f.input :introduction
      f.input :biography
      f.input :goals
      f.input :learning_goals
      f.input :teach
    end
    f.inputs "Links" do
      f.input :linked_in
      f.input :yammer
      f.input :github
    end
    f.inputs "Projects" do
      f.input :projects, as: :check_boxes, collection: Project.all
    end
    f.actions
  end
end
