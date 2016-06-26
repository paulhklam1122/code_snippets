class SnippetsController < ApplicationController
  before_action :authenticate_user!, except:[:show, :index]
  before_action :find_snippet, only:[:show, :edit, :update, :destroy]

  def show
    render :false if @snippet.user != current_user && @snippet.private == 1
  end

  def new
    @snippet = Snippet.new
  end

  def create
    # @category = Category.find params[:category_id]
    @snippet = Snippet.new snippet_params
    @snippet.user = current_user
    # @snippet.category = @category
    if @snippet.save
      redirect_to category_path(@snippet.category_id), notice: "Snippet created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice: "Snippet Updated!"
    else
      flash[:alert] = "Snippet not updated!"
      render :edit
    end
  end

  def destroy
    @snippet.destroy
    redirect_to category_path(@snippet.category_id), notice: "Snippet Deleted!"
  end

  def snippet_language(snippet)
  c = Category.find snippet.category_id
  :"#{c.name}"
  end
  helper_method :snippet_language

  private

  def snippet_params
    params.require(:snippet).permit(:title, :work, :category_id, :private)
  end

  def find_snippet
    @snippet = Snippet.find params[:id]
  end
end
