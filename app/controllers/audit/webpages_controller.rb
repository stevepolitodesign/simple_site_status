class Audit::WebpagesController < ApplicationController
  def new
    @webpage = Webpage.new
  end

  def create
    @webpage = Webpage.create(webpage_params)
    Audit::Webpage::CreateJob.perform_now(@webpage)

    redirect_to audit_webpage_path(@webpage)
  end

  def show
    @webpage = Webpage.find(params[:id])
  end

  private

  def webpage_params
    params.require(:webpage).permit(:url)
  end
end
