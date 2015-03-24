class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_athletes, :load_home_athletes, :load_blog_posts, :load_videos_home, :load_more_videos

  protected

  def load_athletes
    @athletes = Refinery::Athletes::Athlete.all
  end

  def load_home_athletes
    @home_athletes = Refinery::Athletes::Athlete.limit(3)
  end

  def load_blog_posts
    @home_blog = Refinery::Blog::Post.limit(3)
  end

  def load_videos_home
    @home_video_hero = Refinery::Videos::Video.first

  end

  def load_more_videos
    @home_videos = Refinery::Videos::Video.limit(3).offset(1)
  end

  def load_videos
    @videos = Refinery::Videos::Video.all
  end

end
