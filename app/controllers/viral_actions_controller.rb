class ViralActionsController < ApplicationController
  def create
    @viral_action = ViralAction.new(user_params)
    Rails.logger.info "@@@session@@@"+session[:source].to_s
    respond_to do |format|
      @log = ViralAction.new(device: params[:viral_action][:device], platform: params[:viral_action][:platform])
      @log.save
    
      format.json { render json: {status: "sucess"}, status: :created}
    end
  end

  private
    def user_params
      params.require(:viral_action).permit(:platform, :device)
    end
end
