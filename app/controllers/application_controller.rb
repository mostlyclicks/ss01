class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_athletes, :load_home_athletes, :load_blog_posts, :load_videos_home, :load_more_videos
  before_filter :load_contributors
  before_filter :load_team_members
  before_filter :load_quotes
  before_filter :load_videos

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
    @home_blog = Refinery::Blog::Post.limit(10)
  end

  def load_videos
    @videos = Refinery::Videos::Video.all
  end

  def load_videos_home
    @main_videos = Refinery::Videos::Video.all
    @home_video_hero = @main_videos.sample
  end

  def load_more_videos
    @home_videos = Refinery::Videos::Video.limit(3)
  end

  def load_team_members
    Refinery::TeamMembers::TeamMember.all.each do |x|
      if x.name == 'Alex Coci'
        @alex = x
       elsif x.title == 'Co-Owner, Director of Operations'
         @bjorn = x
      elsif x.name == "Deniz Hekmati"
        @deniz = x
      elsif x.name == "Jesper Akesson"
        @jesper = x  
      elsif x.name == "Derek Knittle"
        @derek = x
      end
    end
  end

  def load_quotes
    @quotes = Refinery::Quotes::Quote.all
  end



  def load_contributors
    @contributors = Refinery::Contributors::Contributor.all
  end

end
