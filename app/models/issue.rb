class Issue < Github::Issue
	
end


# # Non-activerecord model
# class Issue

# 	# Gets all issues for any given project.
# 	def self.all(project)
		
# 		enabled_labels = project.labels.find_all_by_enabled(true) || []

#    		label_list = []
	    
# 	    for label in enabled_labels
# 	      label_list << label.name
# 	    end

	
# 	    if label_list.empty?
# 	      issues = []
# 	    else
# 	      issues = @octokit.issues(repo, {:labels => label_list.join(",")} )
# 	    end

# 	    issues_hash = {}
	    
# 	    issues.each do |issue| 
	      
# 	      issue.labels.each do |label|
# 	        if not label_list.include?(label.name)
# 	          issue.labels.delete(label) 
# 	        end
# 	      end
	      
# 	      issues_hash[issue.number] = issue
# 	    end
	    
# 	 #    self.issues = issues_hash


# 		raise "Not implemented"

# 		return # array of issues
# 	end

# 	def get_comments
# 		@octokit.issue_comments(repo, issue.number)
# 	end
# end