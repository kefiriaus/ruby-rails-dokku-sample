class ApplicationJob < ActiveJob::Base
  self.queue_adapter = :delayed_job
end
