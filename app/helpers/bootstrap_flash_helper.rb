module BootstrapFlashHelper
  ALERT_TYPES = %i[success info warning error].freeze

  def bootstrap_flashes
    toasts = []
    flash.each do |type, message|
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :warning if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        next if msg.blank?

        toasts << render('layouts/flash', type: type, message: msg)
      end
    end

    toasts.join("\n").html_safe
  end
end
