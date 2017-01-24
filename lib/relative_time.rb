require 'relative_time/in_words'
require 'relative_time/version'

module RelativeTime
  # Your code goes here...
  def self.in_words(time_to)
    InWords.new.(time_to)
  end
end
