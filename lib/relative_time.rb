# typed: true
require 'relative_time/in_words'
require 'relative_time/version'

module RelativeTime
  def self.in_words(date_to, date_from = Time.now, locale: :en)
    InWords.new(locale: locale).(date_to, date_from)
  end
end
