class Admin::PagesController < AdminController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]

  # GET /admin/pages
  def index
    @pages = Page.all
  end

  # GET /admin/pages/1
  def show
  end

  # GET /admin/pages/new
  def new
    @page = Page.new
  end

  # GET /admin/pages/1/edit
  def edit
  end

  # POST /admin/pages
  def create
    @page = Page.new(admin_page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_page_path(@page), flash: { success: 'La página fue creada con éxito!' } }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/pages/1
  def update
    respond_to do |format|
      if @page.update(admin_page_params)
        format.html { redirect_to admin_page_path(@page),  flash: { success: 'La página se actualizó con éxito!' } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/pages/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: 'La página fue destruida con éxito!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_page
      @page = Page.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_page_params
      params.require(:page).permit(:title, :content)
    end
end
