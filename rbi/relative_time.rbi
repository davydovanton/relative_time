# typed: strong

module RelativeTime
  sig do
    params(
      date_to: T.any(Time, DateTime, Date),
      date_from: T.any(Time, DateTime, Date),
      locale: T.any(NilClass, String, Symbol)
    ).returns(String)
  end
  def self.in_words(date_to, date_from = nil, locale: nil); end
end

class RelativeTime::InWords
  sig do
    params(
      date_to: T.any(Time, DateTime, Date),
      date_from: T.any(Time, DateTime, Date)
    ).returns(String)
  end
  def call(date_to, date_from); end

  sig { params(locale: T.any(NilClass, String, Symbol)).void }
  def initialize(locale: nil); end

  sig { params(diff: Integer).returns(String) }
  def resolution(diff); end

  sig { void }
  def self.setup; end
end
