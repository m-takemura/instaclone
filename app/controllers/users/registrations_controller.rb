class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end

  #サインアップ後、リダイレクト先を変更する
  def after_sign_up_path_for(resource)
    new_user_session_path
  end
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end
