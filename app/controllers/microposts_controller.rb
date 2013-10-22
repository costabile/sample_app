class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    if params[:micropost][:content].start_with?("@")
      #get username of addressee and strip off leading @ char
      reply_username = params[:micropost][:content].split(" ", 2)[0][1..-1]
      
      reply_user = User.find_by(username: reply_username)
      if reply_user
        params[:micropost][:in_reply_to] = reply_user.id
      end
    end

    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :in_reply_to)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
