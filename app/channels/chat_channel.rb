class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    receiver = (params[:id] != 4) ? User.find(4) : User.find(data['content']['id'])
    msg = Message.create(content: data['content']['message'], receiver: receiver, sender: User.find(params[:id]))
    ActionCable.server.broadcast("chat_#{receiver.id}", {type: :message, content: msg.content, id: params[:id] })
  end

  def read(data)
    receiver = (params[:id] != 4) ? User.find(4) : User.find(data['content'])
    ActionCable.server.broadcast("chat_#{receiver.id}", {type: :read, content: '', id: params[:id] })

  end

  def typing(data)
    receiver = (params[:id] != 4) ? User.find(4) : User.find(data['content'])
    ActionCable.server.broadcast("chat_#{receiver.id}", {type: :typing, content: '', id: params[:id]} )
  end
end
