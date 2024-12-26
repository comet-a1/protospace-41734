# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

# 新規登録後のリダイレクト先を指定
  def after_sign_up_path_for(resource)
    root_path # または index.html.erb に該当するパス
  end

# アカウント登録後のリダイレクト先
  def after_inactive_sign_up_path_for(resource)
    root_path # 必要に応じて変更
  end
end
