class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [ :create ]
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: {
        message: "Usuário cadastrado com sucesso.",
        user: resource.as_json(only: [ :id, :email, :name, :created_at ])
      }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name)
  end
end
