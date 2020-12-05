class TweetController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:type] == "all_tweets"
      ids = current_user.followers.pluck(:id)
      @tweets = TweetContent.where(user_id: ids)
    else
      @tweets = current_user.tweets
    end
  end

  def new
    @tweet = TweetContent.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to new_tweet_path, :notice => "Successfully created"
    else
      render "new", :notice => "Something went wrong."
    end
  end

  private

  def tweet_params
    params.require(:tweet_content).permit(:content)
  end
end
