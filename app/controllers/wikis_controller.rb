class WikisController < ApplicationController
  before_filter :appname
  before_filter :find_article, :only => [:show]
   load_and_authorize_resource
  # GET /wikis
  # GET /wikis.json
  def index
    # @wikis = Wiki.all
    @wikis = Wiki.find_all_by_title('Home')
    @allwikis = Wiki.recent.limit(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wikis }
    end
  end


  # GET /wikis/1
  # GET /wikis/1.json
  def show
    #TODO: put in a real categories list page
   
   
       respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wiki }
 
    end
  end

  # GET /wikis/new
  # GET /wikis/new.json
  def new
    @wiki = Wiki.new
       @parse = params[:id]
        if @parse 
          if @parse.include?("~~")
            @newtitle = params[:id].tr("~~","")
          else
            @catname = params[:id]
          end
        end
    @wikicat = params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wiki }
    end
  end

  # GET /wikis/1/edit
  def edit
    @wiki = Wiki.find(params[:id])
  end


  def cate
      @catname = params[:postcategory]
      @wikicat = Wiki.find_all_by_postcategory(@catname)
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = Wiki.new(params[:wiki])

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: @wiki.title << ' was successfully created.' }
        format.json { render json: @wiki, status: :created, location: @wiki }
      else
        format.html { render action: "new" }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wikis/1
  # PUT /wikis/1.json
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes(:changed_by => current_user)
      

    respond_to do |format|
      if @wiki.update_attributes(params[:wiki])
        @wiki.audit_tag_with(@wiki.changetag)  
        format.html { redirect_to @wiki, notice: @wiki.title << ' was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy

    respond_to do |format|
      format.html { redirect_to wikis_url }
      format.json { head :no_content }
    end
  end
private 
  def appname
    @appname = "KNOWLEDGE"
  end

  def find_article
    @wiki = Wiki.find(params[:id])
    if @wiki.title == ""
      newtitle = "~~" << (params[:id])
      redirect_to new_wiki_path << "/" << newtitle
    end
  end

end
