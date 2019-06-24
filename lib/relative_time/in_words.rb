# typed: true
require 'i18n'
require 'i18n/backend/pluralization'

module RelativeTime
  class InWords
    def self.setup
      return if @setup

      I18n.load_path << Dir[File.expand_path("#{__dir__}/../../config/locales") + '/*.yml']
      I18n.load_path << Dir[File.expand_path("#{__dir__}/../../config/locales") + '/*.rb']
      I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)

      @setup = true
    end

    def initialize(locale: :en)
      self.class.setup
      I18n.locale = locale
    end

    def call(date_to, date_from)
      diff = date_from.to_time - date_to.to_time
      return I18n.t('relative.less_than_a_minute') if diff.abs.round <= 59

      date_string = resolution(diff.abs.round)
      diff >= 0 ? I18n.t('relative.ago', date_string: date_string) : I18n.t('relative.in', date_string: date_string)
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
