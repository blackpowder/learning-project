module ProjectsHelper
	def link_to_project(project)
		link_to project.name, projects_path(id:project.id, anchor:project.id)
	end
end
