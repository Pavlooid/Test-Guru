class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[edit destroy show update]

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  def edit; end

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show; end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t('.success')
    else
      render :edit
    end
  end

  private 

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :badge_photo_url, :description, :rule_id)
  end
end
