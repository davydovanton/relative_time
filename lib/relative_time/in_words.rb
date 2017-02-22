module RelativeTime
  class InWords
    def call(date_to, date_from)
      diff = date_from.to_time - date_to.to_time
      return 'less than a minute' if diff.abs.round <= 59

      date_string = verb_agreement(resolution(diff.abs.round))
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
        [(diff / YEAR).round, 'years']
      elsif diff >= MONTH
        [(diff / MONTH).round, 'months']
      elsif diff >= WEEK
        [(diff / WEEK).round, 'weeks']
      elsif diff >= DAY
        [(diff / DAY).round, 'days']
      elsif diff >= HOUR
        [(diff / HOUR).round, 'hours']
      else
        [(diff / MINUTE).round, 'minutes']
      end
    end

    def verb_agreement(resolution)
      if resolution[0] == 1
        "a #{resolution.last[0...-1]}"
      else
        resolution.join(' ')
      end
    end
  end
end
