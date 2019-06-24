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
      it { RelativeTime.in_words(date, date_from, locale: :id).must_equal '1 jam yang lalu' }

      describe 'with both DateTime type' do
        let(:date) { DateTime.new(2017, 1, 15, 11, 0) }
        let(:date_from) { DateTime.new(2017, 1, 18, 15, 0) }

        it { RelativeTime.in_words(date, date_from, locale: :id).must_equal '3 hari yang lalu' }
      end

      describe 'date_from DateTime type' do
        let(:date_from) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :id).must_equal '1 hari yang lalu' }
      end

      describe 'date DataTime type' do
        let(:date) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :id).must_equal 'dalam 23 jam' }
      end
    end

    describe 'when difference in seconds' do
      it { RelativeTime.in_words(date, locale: :id).must_equal      'kurang dari 1 menit' }

      it { RelativeTime.in_words(date - 10, locale: :id).must_equal 'kurang dari 1 menit' }
      it { RelativeTime.in_words(date + 10, locale: :id).must_equal 'kurang dari 1 menit' }

      it { RelativeTime.in_words(date - 59, locale: :id).must_equal 'kurang dari 1 menit' }
      it { RelativeTime.in_words(date + 59, locale: :id).must_equal 'kurang dari 1 menit' }
    end

    describe 'when difference in minutes' do
      it { RelativeTime.in_words(date - 70, locale: :id).must_equal '1 menit yang lalu' }
      it { RelativeTime.in_words(date + 70, locale: :id).must_equal 'dalam 1 menit' }

      it { RelativeTime.in_words(date - 1  * minute, locale: :id).must_equal  '1 menit yang lalu' }
      it { RelativeTime.in_words(date - 3  * minute, locale: :id).must_equal  '3 menit yang lalu' }
      it { RelativeTime.in_words(date - 20 * minute, locale: :id).must_equal '20 menit yang lalu' }
      it { RelativeTime.in_words(date - 59 * minute, locale: :id).must_equal '59 menit yang lalu' }

      it { RelativeTime.in_words(date + 1  * minute, locale: :id).must_equal 'dalam 1 menit' }
      it { RelativeTime.in_words(date + 3  * minute, locale: :id).must_equal 'dalam 3 menit' }
      it { RelativeTime.in_words(date + 20 * minute, locale: :id).must_equal 'dalam 20 menit' }
      it { RelativeTime.in_words(date + 59 * minute, locale: :id).must_equal 'dalam 59 menit' }
    end

    describe 'when difference in hours' do
      it { RelativeTime.in_words(date - 70 * minute, locale: :id).must_equal  '1 jam yang lalu' }
      it { RelativeTime.in_words(date + 70 * minute, locale: :id).must_equal  'dalam 1 jam' }

      it { RelativeTime.in_words(date - 60 * minute, locale: :id).must_equal  '1 jam yang lalu' }
      it { RelativeTime.in_words(date + 60 * minute, locale: :id).must_equal  'dalam 1 jam' }

      it { RelativeTime.in_words(date - 1  * hour, locale: :id).must_equal  '1 jam yang lalu' }
      it { RelativeTime.in_words(date - 3  * hour, locale: :id).must_equal  '3 jam yang lalu' }
      it { RelativeTime.in_words(date - 10 * hour, locale: :id).must_equal '10 jam yang lalu' }
      it { RelativeTime.in_words(date - 23 * hour, locale: :id).must_equal '23 jam yang lalu' }

      it { RelativeTime.in_words(date + 1  * hour, locale: :id).must_equal 'dalam 1 jam' }
      it { RelativeTime.in_words(date + 3  * hour, locale: :id).must_equal 'dalam 3 jam' }
      it { RelativeTime.in_words(date + 10 * hour, locale: :id).must_equal 'dalam 10 jam' }
      it { RelativeTime.in_words(date + 23 * hour, locale: :id).must_equal 'dalam 23 jam' }
    end

    describe 'when difference in days' do
      it { RelativeTime.in_words(date - 24 * hour, locale: :id).must_equal  '1 hari yang lalu' }
      it { RelativeTime.in_words(date + 24 * hour, locale: :id).must_equal  'dalam 1 hari' }

      it { RelativeTime.in_words(date - 1 * day, locale: :id).must_equal '1 hari yang lalu' }
      it { RelativeTime.in_words(date - 3 * day, locale: :id).must_equal '3 hari yang lalu' }
      it { RelativeTime.in_words(date - 6 * day, locale: :id).must_equal '6 hari yang lalu' }

      it { RelativeTime.in_words(date + 1 * day, locale: :id).must_equal 'dalam 1 hari' }
      it { RelativeTime.in_words(date + 3 * day, locale: :id).must_equal 'dalam 3 hari' }
      it { RelativeTime.in_words(date + 6 * day, locale: :id).must_equal 'dalam 6 hari' }
    end

    describe 'when difference in weeks' do
      it { RelativeTime.in_words(date - 7 * day, locale: :id).must_equal  '1 minggu yang lalu' }
      it { RelativeTime.in_words(date + 7 * day, locale: :id).must_equal  'dalam 1 minggu' }

      it { RelativeTime.in_words(date - 8 * day, locale: :id).must_equal  '1 minggu yang lalu' }
      it { RelativeTime.in_words(date + 8 * day, locale: :id).must_equal  'dalam 1 minggu' }

      it { RelativeTime.in_words(date - 1 * week, locale: :id).must_equal '1 minggu yang lalu' }
      it { RelativeTime.in_words(date - 3 * week, locale: :id).must_equal '3 minggu yang lalu' }

      it { RelativeTime.in_words(date + 1 * week, locale: :id).must_equal 'dalam 1 minggu' }
      it { RelativeTime.in_words(date + 3 * week, locale: :id).must_equal 'dalam 3 minggu' }
    end

    describe 'when difference in months' do
      it { RelativeTime.in_words(date - 4 * week, locale: :id).must_equal '1 bulan yang lalu' }
      it { RelativeTime.in_words(date + 4 * week, locale: :id).must_equal 'dalam 1 bulan' }

      it { RelativeTime.in_words(date - 6 * week, locale: :id).must_equal '1 bulan yang lalu' }
      it { RelativeTime.in_words(date + 6 * week, locale: :id).must_equal 'dalam 1 bulan' }

      it { RelativeTime.in_words(date - 1  * month, locale: :id).must_equal '1 bulan yang lalu' }
      it { RelativeTime.in_words(date - 11 * month, locale: :id).must_equal '11 bulan yang lalu' }

      it { RelativeTime.in_words(date + 1  * month, locale: :id).must_equal 'dalam 1 bulan' }
      it { RelativeTime.in_words(date + 11 * month, locale: :id).must_equal 'dalam 11 bulan' }
    end

    describe 'when difference in years' do
      it { RelativeTime.in_words(date - 12 * month, locale: :id).must_equal '1 tahun yang lalu' }
      it { RelativeTime.in_words(date + 12 * month, locale: :id).must_equal 'dalam 1 tahun' }

      it { RelativeTime.in_words(date - 14 * month, locale: :id).must_equal '1 tahun yang lalu' }
      it { RelativeTime.in_words(date + 14 * month, locale: :id).must_equal 'dalam 1 tahun' }

      it { RelativeTime.in_words(date - 1  * year, locale: :id).must_equal '1 tahun yang lalu' }
      it { RelativeTime.in_words(date - 11 * year, locale: :id).must_equal '11 tahun yang lalu' }

      it { RelativeTime.in_words(date + 1  * year, locale: :id).must_equal 'dalam 1 tahun' }
      it { RelativeTime.in_words(date + 11 * year, locale: :id).must_equal 'dalam 11 tahun' }
    end
  end
end

