class CommentsController < ApplicationController
  before_action :set_blog_post, only: [:create]

  def create
    if (current_user)
      @blog_post.comments.create(comment_params.to_h.merge!({user_id: current_user.id}))
    else
      @blog_post.comments.create(comment_params)
    end
    
    redirect_to blog_post_path(@blog_post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  rescue ActiveRecord::RecordNotFound 
    redirect_to root_path
  end
end
