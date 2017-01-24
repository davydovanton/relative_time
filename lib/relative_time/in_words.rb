module RelativeTime
  class InWords
    def call(time_to)
      diff = Time.now - time_to

      return 'less than a minute' if diff.abs < 59

      if diff >= 0
        relative_ago(verb_agreement(resolution(diff)))
      else
        relative_later(verb_agreement(resolution(diff.abs)))
      end
    end

  private
    def resolution(diff)
      if diff > 29030400
        [(diff/29030400).round, 'years']
      elsif diff > 2419200
        [(diff/2419200).round, 'months']
      elsif diff > 604800
        [(diff/604800).round, 'weeks']
      elsif diff > 86400
        [(diff/86400).round, 'days']
      elsif diff > 3600
        [(diff/3600).round, 'hours']
      else
        [(diff/60).round, 'minutes']
      end
    end

    def verb_agreement(resolution)
      if resolution[0] == 1
        "a #{resolution.last[0...-1]}"
      else
        resolution.join(' ')
      end
    end

    def relative_ago(string)
      "#{string} ago"
    end

    def relative_later(string)
      "in #{string}"
    end
  end
end
