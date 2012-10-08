class WikisController < ApplicationController
  before_filter :appname
  before_filter :find_article, :only => [:show]
  before_filter :there_is_no_spoon, :only => :new
  before_filter :revision_finder, :only => [:audit, :revert]
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

def archives
  @wikiarchive = Wiki.paginate(:page => params[:page], :per_page => 10, :conditions => "slug!='cate'", :order => "UPPER(title) ASC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wikis }
    end
end

def catearchives
  @catearchive = Wiki.paginate(:page => params[:page], :per_page => 10, :group => "postcategory, wikis.id", :conditions => "postcategory!='/wiki'", :order => "UPPER(postcategory) ASC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wikis }
    end
end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wiki }
 
    end
  end

  # GET /wikis/new
  # GET /wikis/new.json
  def new
    @wiki = Wiki.new
    # @wikicat = params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wiki }
    end
  end

  # GET /wikis/1/edit
  def edit
    @wiki = Wiki.find(params[:id])
  end

  def audit
    @newaudit = @wiki.audits.find(@currentauditid)
    @oldaudit = @wiki.audits.find(@oldauditid)
  end

  def revert
    @oldaudit = @wiki.audits.find_by_id(@oldauditid)
    @wiki.body = @oldaudit.modifications['body']
    @reverttag = "Article Reverted"
    @wiki.audit_tag_with(@reverttag)
    @wiki.update_attributes(:changed_by => current_user)
    @wiki.save
    redirect_to wiki_path(params[:id])
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

  def there_is_no_spoon
     @parse = params[:id]
        if @parse 
          if @parse.include?("~~")
            @parsenext = params[:id].tr("~~","")
            @newtitle = @parsenext.tr("-"," ").titlecase
             flash[:notice] = 'The article ' << @newtitle  << " doesn't exist, but you can create it here."
          else
            @newtitle = ""
            @catname = params[:id]
          end
        end
      end

  def find_article
    @wiki = Wiki.find_or_create_by_slug(params[:id])
    if @wiki.title == "cate"
      redirect_to "/wikis/all/cate"
    end
    if @wiki.title == ""
      newtitle = "~~" << (params[:id])
      redirect_to new_wiki_path << "/" << newtitle
    end
  end

  def revision_finder
    @wiki = Wiki.find(params[:id])
    @currentauditid = params[:next]
    @oldauditid = @currentauditid.to_i - 1
  end

end
