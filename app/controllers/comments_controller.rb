class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: "コメントを投稿しました"
    else
      redirect_to post_path(@post), alert: "コメントの投稿に失敗しました"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post), notice: "コメントを削除しました", status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
