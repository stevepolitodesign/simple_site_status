class AuditsController < ApplicationController
  # TODO: Maybe it needs to be like this:
  # Audit type :webpage, :sitemap
  # Sitemap has_many :urls
  # Url has_one :document
  # Document has_many :links
  # Link has_one :status
  def new
    @audit = Audit.new(params.fetch(:audit, {}).permit(:url))

    if @audit.url
      _response = Request.get(@audit.url)
      body = Nokogiri::HTML(_response)
      document = Document.new(body:)

      @audit.document = document
    end
  end

  def create
    @audit = Audit.create(audit_params)

    redirect_to audit_path(@audit)
  end

  def show
    debugger
    @audit = Audit.create(url: params[:id])
  end

  private

  def audit_params
    params.require(:audit).permit(:url)
  end
end
