class Admin::MailSettingsController < ApplicationController
  
  def index
    @mail_settings = MailSetting.all
  end
  def new
    @mail_setting = MailSetting.new
  end
  
  def create
    @mail_setting = MailSetting.create(params[:mail_setting])
    if @mail_setting.save
      redirect_to [:admin, @mail_setting], notice: "Your Mail Settings have been created."
    else
      redirect_to :back
    end
  end
  
  def show
    @mail_setting = MailSetting.find(params[:id])
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end