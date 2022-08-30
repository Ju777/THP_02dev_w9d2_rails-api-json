class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = Article.find(params[:article_id])

    puts "#"*100
    puts params
    puts "#"*100

    if @comment.save
      render json: @comment, status: :created #, location: @comment => mis en commentaire car provoque une erreur dans la réponse de la requête consécutive à une redirection qui ne fonctionne pas (les routes étant imbriquées)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update

    if (current_user.id === @comment.user_id) && @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :article_id)
    end
end
