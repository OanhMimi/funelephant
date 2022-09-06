json.user do
    json.extract! @user, :id, :firstName, :lastName, :email, :created_at, :updated_at
  end