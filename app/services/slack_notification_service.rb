class SlackNotificationService

  def initialize(user)
    @user = user
  end

  def call
    notifier = Slack::Notifier.new ENV.fetch("SLACK_WEBHOOK_URL"), username: 'Notifier', icon_emoji: ':ghost:'
    notifier.ping "Nouvel utilisateur en #{Rails.env.production? ? "prod" : "local"}: #{@user.email}"
  end

end
