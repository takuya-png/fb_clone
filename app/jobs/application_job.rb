class ApplicationJob < ActiveJob::Base
  default from: 'from@example.com'
  layout 'mailer'
end
