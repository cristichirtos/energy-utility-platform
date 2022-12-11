class NotificationsService
  class << self
    def broadcast(user_id:, message:)
      ActionCable.server.broadcast("notifications_#{user_id}", { body: message })
    end
  end
end
