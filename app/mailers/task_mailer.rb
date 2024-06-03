class TaskMailer < ApplicationMailer
  default from: 'notifications@taskmanager.com'

  def deadline_alert(task, time_frame)
    @task = task
    @time_frame = time_frame
    mail(to: @task.user.email, subject: "Task Deadline Alert: #{@task.title}")
  end
end
