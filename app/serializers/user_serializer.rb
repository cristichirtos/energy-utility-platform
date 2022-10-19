class UserSerializer < ActiveModel::Serializer
  attributes :id, :access_token, :username, :name, :role

  def role
    object.admin? ? 'Admin' : 'Client'
  end
end
