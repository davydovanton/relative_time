require 'i18n'

module RelativeTime
  class InWords
    def initialize(locale: :en)
      I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
      I18n.locale = locale
    end

    def call(date_to, date_from)
      diff = date_from.to_time - date_to.to_time
      return 'less than a minute' if diff.abs.round <= 59

      date_string = resolution(diff.abs.round)
      diff >= 0 ? "#{date_string} ago" : "in #{date_string}"
    end

  private
    MINUTE = 60
    HOUR   = 60 * MINUTE
    DAY    = 24 * HOUR
    WEEK   = 7  * DAY
    MONTH  = 4  * WEEK
    YEAR   = 12 * MONTH

    def resolution(diff)
      if diff >= YEAR
        I18n.t('relative.years', count: (diff / YEAR).round)
      elsif diff >= MONTH
        I18n.t('relative.months', count: (diff / MONTH).round)
      elsif diff >= WEEK
        I18n.t('relative.weeks', count: (diff / WEEK).round)
      elsif diff >= DAY
        I18n.t('relative.days', count: (diff / DAY).round)
      elsif diff >= HOUR
        I18n.t('relative.hours', count: (diff / HOUR).round)
      else
        I18n.t('relative.minutes', count: (diff / MINUTE).round)
      end
    end
  end
end
