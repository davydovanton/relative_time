require 'test_helper'

describe RelativeTime do
  describe '#in_words' do
    describe 'when differense in seconds' do
      it { RelativeTime.in_words(Time.now).must_equal      'less than a minute' }
      it { RelativeTime.in_words(Time.now - 10).must_equal 'less than a minute' }
      it { RelativeTime.in_words(Time.now + 10).must_equal 'more than a minute' }
    end
  end
end
