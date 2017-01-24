require 'test_helper'

describe RelativeTime do
  describe '#in_words' do
    describe 'when differense in seconds' do
      it { RelativeTime.in_words(Time.now).must_equal      'less than a minute' }
      it { RelativeTime.in_words(Time.now - 10).must_equal 'less than a minute' }
      it { RelativeTime.in_words(Time.now + 10).must_equal 'less than a minute' }
    end

    describe 'when differense in minutes' do
      it { RelativeTime.in_words(Time.now - 1 * 60).must_equal 'a minute ago' }
      it { RelativeTime.in_words(Time.now - 3 * 60).must_equal '3 minutes ago' }

      it { RelativeTime.in_words(Time.now + 1 * 60).must_equal 'in a minute' }
      it { RelativeTime.in_words(Time.now + 3 * 60).must_equal 'in 3 minutes' }
    end
  end
end
