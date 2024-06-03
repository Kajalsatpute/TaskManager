class Task < ApplicationRecord
  belongs_to :user
  STATES = %w[Backlog In-progress Done].freeze
  validates :title, :state, :deadline, presence: true
  validates :state, inclusion: { in: STATES }
  scope :not_done, -> { where.not(state: 'Done') }
  after_save :schedule_deadline_alerts

  private

  def schedule_deadline_alerts
    return if state == 'Done'
    
    DeadlineAlertJob.set(wait_until: (deadline - 1.day)).perform_later(id, '1 day')
    DeadlineAlertJob.set(wait_until: (deadline - 1.hour)).perform_later(id, '1 hour')
  end
end
