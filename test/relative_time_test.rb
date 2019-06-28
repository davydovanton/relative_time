# typed: false
require 'test_helper'

describe RelativeTime do
  let(:date)   { Time.now }

  let(:minute) { 60 }
  let(:hour)   { 60 * minute }
  let(:day)    { 24 * hour }
  let(:week)   { 7  * day }
  let(:month)  { 4  * week }
  let(:year)   { 12 * month }

  describe '#in_words' do
    describe 'with from date' do
      let(:date_from) { Time.now + 1 * hour }
      it { RelativeTime.in_words(date, date_from).must_equal 'an hour ago' }

      describe 'with both DateTime type' do
        let(:date) { DateTime.new(2017, 1, 15, 11, 0) }
        let(:date_from) { DateTime.new(2017, 1, 18, 15, 0) }

        it { RelativeTime.in_words(date, date_from).must_equal '3 days ago' }
      end

      describe 'date_from DateTime type' do
        let(:date_from) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from).must_equal 'a day ago' }
      end

      describe 'date DataTime type' do
        let(:date) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from).must_equal 'in 23 hours' }
      end
    end

    describe 'when difference in seconds' do
      it { RelativeTime.in_words(date).must_equal      'less than a minute' }

      it { RelativeTime.in_words(date - 10).must_equal 'less than a minute' }
      it { RelativeTime.in_words(date + 10).must_equal 'less than a minute' }

      it { RelativeTime.in_words(date - 59).must_equal 'less than a minute' }
      it { RelativeTime.in_words(date + 59).must_equal 'less than a minute' }
    end

    describe 'when difference in minutes' do
      it { RelativeTime.in_words(date - 70).must_equal 'a minute ago' }
      it { RelativeTime.in_words(date + 70).must_equal 'in a minute' }

      it { RelativeTime.in_words(date - 1  * minute).must_equal  'a minute ago' }
      it { RelativeTime.in_words(date - 3  * minute).must_equal  '3 minutes ago' }
      it { RelativeTime.in_words(date - 20 * minute).must_equal '20 minutes ago' }
      it { RelativeTime.in_words(date - 59 * minute).must_equal '59 minutes ago' }

      it { RelativeTime.in_words(date + 1  * minute).must_equal 'in a minute' }
      it { RelativeTime.in_words(date + 3  * minute).must_equal 'in 3 minutes' }
      it { RelativeTime.in_words(date + 20 * minute).must_equal 'in 20 minutes' }
      it { RelativeTime.in_words(date + 59 * minute).must_equal 'in 59 minutes' }
    end

    describe 'when difference in hours' do
      it { RelativeTime.in_words(date - 70 * minute).must_equal  'an hour ago' }
      it { RelativeTime.in_words(date + 70 * minute).must_equal  'in an hour' }

      it { RelativeTime.in_words(date - 60 * minute).must_equal  'an hour ago' }
      it { RelativeTime.in_words(date + 60 * minute).must_equal  'in an hour' }

      it { RelativeTime.in_words(date - 1  * hour).must_equal  'an hour ago' }
      it { RelativeTime.in_words(date - 3  * hour).must_equal  '3 hours ago' }
      it { RelativeTime.in_words(date - 10 * hour).must_equal '10 hours ago' }
      it { RelativeTime.in_words(date - 23 * hour).must_equal '23 hours ago' }

      it { RelativeTime.in_words(date + 1  * hour).must_equal 'in an hour' }
      it { RelativeTime.in_words(date + 3  * hour).must_equal 'in 3 hours' }
      it { RelativeTime.in_words(date + 10 * hour).must_equal 'in 10 hours' }
      it { RelativeTime.in_words(date + 23 * hour).must_equal 'in 23 hours' }
    end

    describe 'when difference in days' do
      it { RelativeTime.in_words(date - 24 * hour).must_equal  'a day ago' }
      it { RelativeTime.in_words(date + 24 * hour).must_equal  'in a day' }

      it { RelativeTime.in_words(date - 1 * day).must_equal 'a day ago' }
      it { RelativeTime.in_words(date - 3 * day).must_equal '3 days ago' }
      it { RelativeTime.in_words(date - 6 * day).must_equal '6 days ago' }

      it { RelativeTime.in_words(date + 1 * day).must_equal 'in a day' }
      it { RelativeTime.in_words(date + 3 * day).must_equal 'in 3 days' }
      it { RelativeTime.in_words(date + 6 * day).must_equal 'in 6 days' }
    end

    describe 'when difference in weeks' do
      it { RelativeTime.in_words(date - 7 * day).must_equal  'a week ago' }
      it { RelativeTime.in_words(date + 7 * day).must_equal  'in a week' }

      it { RelativeTime.in_words(date - 8 * day).must_equal  'a week ago' }
      it { RelativeTime.in_words(date + 8 * day).must_equal  'in a week' }

      it { RelativeTime.in_words(date - 1 * week).must_equal 'a week ago' }
      it { RelativeTime.in_words(date - 3 * week).must_equal '3 weeks ago' }

      it { RelativeTime.in_words(date + 1 * week).must_equal 'in a week' }
      it { RelativeTime.in_words(date + 3 * week).must_equal 'in 3 weeks' }
    end

    describe 'when difference in months' do
      it { RelativeTime.in_words(date - 4 * week).must_equal 'a month ago' }
      it { RelativeTime.in_words(date + 4 * week).must_equal 'in a month' }

      it { RelativeTime.in_words(date - 6 * week).must_equal 'a month ago' }
      it { RelativeTime.in_words(date + 6 * week).must_equal 'in a month' }

      it { RelativeTime.in_words(date - 1  * month).must_equal 'a month ago' }
      it { RelativeTime.in_words(date - 11 * month).must_equal '11 months ago' }

      it { RelativeTime.in_words(date + 1  * month).must_equal 'in a month' }
      it { RelativeTime.in_words(date + 11 * month).must_equal 'in 11 months' }
    end

    describe 'when difference in years' do
      it { RelativeTime.in_words(date - 12 * month).must_equal 'a year ago' }
      it { RelativeTime.in_words(date + 12 * month).must_equal 'in a year' }

      it { RelativeTime.in_words(date - 14 * month).must_equal 'a year ago' }
      it { RelativeTime.in_words(date + 14 * month).must_equal 'in a year' }

      it { RelativeTime.in_words(date - 1  * year).must_equal 'a year ago' }
      it { RelativeTime.in_words(date - 11 * year).must_equal '11 years ago' }

      it { RelativeTime.in_words(date + 1  * year).must_equal 'in a year' }
      it { RelativeTime.in_words(date + 11 * year).must_equal 'in 11 years' }
    end
  end
end
