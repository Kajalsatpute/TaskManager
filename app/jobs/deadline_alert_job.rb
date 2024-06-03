class DeadlineAlertJob < ApplicationJob
  queue_as :default

  def perform(task_id, time_frame)
    task = Task.find(task_id)
    TaskMailer.deadline_alert(task, time_frame).deliver_later if task.state != 'Done'
  end
end
