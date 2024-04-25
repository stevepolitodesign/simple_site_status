class AuditsController < ApplicationController
  def new
    @audit = Audit.new(params.fetch(:audit, {}).permit(:url))
  end
end
