module TasksHelper
	def taskedto(userid)
      @taskedto = User.find_by_id(userid).firstname
    end

    def logtime(userid)
    	if userid.include? current_user.id
    		#make this work with javascript timer
    		render 'tasks/timer'
    	end
    end
end
