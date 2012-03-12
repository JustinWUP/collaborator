class Github::Label <  Github::AbstractResource

	self.site = 'https://api.github.com/repos/:gh_user/:gh_repo'

	def self.find_by_project(project)
		user, repo = project.repo.split('/')
		all_labels = LabelCollection.new( find(:all, params: {gh_user: user, gh_repo: repo}) )
		all_labels 
	end

	class LabelCollection < Array 
		def find_by_name(name)
			self.each do |label|
				return label if label.name == name 
			end
			nil
		end
	end
end
