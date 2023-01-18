module Rpc
  class MessagesController < ::Gruf::Controllers::Base
    bind ::Rpc::Messages::Service

    ##
    # @return [Demo::GetJobResp] The job response
    #
    def get_message
      message = ::Device.find(request.message.id)
      Rpc::GetMessageResp.new(id: message.id)
    rescue ActiveRecord::RecordNotFound => _e
      fail!(:not_found, :job_not_found, "Failed to find Job with ID: #{request.message.id}")
    rescue StandardError => e
      set_debug_info(e.message, e.backtrace[0..4])
      fail!(:internal, :internal, "ERROR: #{e.message}")
    end
  end
end
