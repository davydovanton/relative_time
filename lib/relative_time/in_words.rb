module RelativeTime
  class InWords
    def call(time_to)
      diff = Time.now - time_to
      if diff > 0
        'less than a minute'
      else
        'more than a minute'
      end
    end
  end
end
