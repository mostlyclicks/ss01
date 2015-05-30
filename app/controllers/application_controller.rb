class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_athletes, :load_home_athletes, :load_blog_posts, :load_videos_home, :load_more_videos
  before_filter :load_contributors

  protected

 def create
    @sep_signup = SepSignup.new(params[:sep_signup])

    respond_to do |format|
      if @sep_signup.save
        format.html { redirect_to @sep_signup, notice: 'Sep signup was successfully created.' }
        format.json { render json: @sep_signup, status: :created, location: @sep_signup }
      else
        format.html { render action: "new" }
        format.json { render json: @sep_signup.errors, status: :unprocessable_entity }
      end
    end
  end

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
    @home_videos = Refinery::Videos::Video.limit(10)
  end

  def load_videos
    @videos = Refinery::Videos::Video.all
  end

  def load_contributors
    @contributors = Refinery::Contributors::Contributor.all
  end

end
