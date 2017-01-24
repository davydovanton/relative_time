require 'test_helper'

describe RelativeTime do
  let(:minute) { 60 }
  let(:hour)   { 60 * minute }
  let(:day)    { 24 * hour }

  describe '#in_words' do
    describe 'when differense in seconds' do
      it { RelativeTime.in_words(Time.now).must_equal      'less than a minute' }

      it { RelativeTime.in_words(Time.now - 10).must_equal 'less than a minute' }
      it { RelativeTime.in_words(Time.now + 10).must_equal 'less than a minute' }

      it { RelativeTime.in_words(Time.now - 59).must_equal 'less than a minute' }
      it { RelativeTime.in_words(Time.now + 59).must_equal 'less than a minute' }
    end

    describe 'when differense in minutes' do
      it { RelativeTime.in_words(Time.now - 70).must_equal 'a minute ago' }
      it { RelativeTime.in_words(Time.now + 70).must_equal 'in a minute' }

      it { RelativeTime.in_words(Time.now - 1  * minute).must_equal  'a minute ago' }
      it { RelativeTime.in_words(Time.now - 3  * minute).must_equal  '3 minutes ago' }
      it { RelativeTime.in_words(Time.now - 20 * minute).must_equal '20 minutes ago' }
      it { RelativeTime.in_words(Time.now - 59 * minute).must_equal '59 minutes ago' }

      it { RelativeTime.in_words(Time.now + 1  * minute).must_equal 'in a minute' }
      it { RelativeTime.in_words(Time.now + 3  * minute).must_equal 'in 3 minutes' }
      it { RelativeTime.in_words(Time.now + 20 * minute).must_equal 'in 20 minutes' }
      it { RelativeTime.in_words(Time.now + 59 * minute).must_equal 'in 59 minutes' }
    end

    describe 'when differense in hours' do
      it { RelativeTime.in_words(Time.now - 70 * minute).must_equal  'a hour ago' }
      it { RelativeTime.in_words(Time.now + 70 * minute).must_equal  'in a hour' }

      it { RelativeTime.in_words(Time.now - 60 * minute).must_equal  'a hour ago' }
      it { RelativeTime.in_words(Time.now + 60 * minute).must_equal  'in a hour' }

      it { RelativeTime.in_words(Time.now - 1  * hour).must_equal  'a hour ago' }
      it { RelativeTime.in_words(Time.now - 3  * hour).must_equal  '3 hours ago' }
      it { RelativeTime.in_words(Time.now - 10 * hour).must_equal '10 hours ago' }
      it { RelativeTime.in_words(Time.now - 23 * hour).must_equal '23 hours ago' }

      it { RelativeTime.in_words(Time.now + 1  * hour).must_equal 'in a hour' }
      it { RelativeTime.in_words(Time.now + 3  * hour).must_equal 'in 3 hours' }
      it { RelativeTime.in_words(Time.now + 10 * hour).must_equal 'in 10 hours' }
      it { RelativeTime.in_words(Time.now + 23 * hour).must_equal 'in 23 hours' }
    end

    describe 'when differense in days' do
      it { RelativeTime.in_words(Time.now - 24 * hour).must_equal  'a day ago' }
      it { RelativeTime.in_words(Time.now + 24 * hour).must_equal  'in a day' }

      it { RelativeTime.in_words(Time.now - 1 * day).must_equal 'a day ago' }
      it { RelativeTime.in_words(Time.now - 3 * day).must_equal '3 days ago' }
      it { RelativeTime.in_words(Time.now - 6 * day).must_equal '6 days ago' }

      it { RelativeTime.in_words(Time.now + 1 * day).must_equal 'in a day' }
      it { RelativeTime.in_words(Time.now + 3 * day).must_equal 'in 3 days' }
      it { RelativeTime.in_words(Time.now + 6 * day).must_equal 'in 6 days' }
    end
  end
end
