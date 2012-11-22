module TasksHelper
	def taskedto(userid)
      @taskedto = User.find_by_id(userid).firstname
    end

    def logtime(userid)
    	if userid.include? current_user.id
    		if !@task.wasbilled and @task.active
    			render 'tasks/timer'
    		end
    	end
    end

    def englishtime(time)
	   	@timeeng = time.to_s.split(".",2)
	    @minssalt = '.' + @timeeng.last
	    @minsraw = (@minssalt.to_d * 0.6) * 100
	    @minseng = @minsraw.to_s.split(".",2)
	    # TODO: i18n these models.
	    if @timeeng.first != "0" and @timeeng.first != "00"
	    	return @timeeng.first + ' hours and ' + @minseng.first + ' minutes.'
	    else
	    	return @minseng.first + ' minutes.'
	    end
	end

	def ready_for_review(task)
		if task.audits.count>1
		if task.audits[@audit.to_i-2].tag == 'Marked for review.'
			return true
		end
	end
	end

end
