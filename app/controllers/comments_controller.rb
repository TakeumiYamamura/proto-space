class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(create_params[:prototype_id])
    @prototype.comments.create(create_params)
  end

  private
  def create_params
    params.require(:comment).permit(:text, :prototype_id, :user_id)
  end

end
