class Admin::MailSettingsController < ApplicationController
  def new
    @mail_setting = MailSetting.new
  end
  
  def create
    @mail_setting = MailSetting.create(params[:mail_setting])
    @mail_setting.save
    redirect_to @mail_setting, notice: "Your Mail Settings have been created."
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end