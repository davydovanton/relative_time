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
      it { RelativeTime.in_words(date, date_from, locale: :be).must_equal 'гадзіну таму' }

      describe 'with both DateTime type' do
        let(:date) { DateTime.new(2017, 1, 15, 11, 0) }
        let(:date_from) { DateTime.new(2017, 1, 18, 15, 0) }

        it { RelativeTime.in_words(date, date_from, locale: :be).must_equal '3 дні таму' }
      end

      describe 'date_from DateTime type' do
        let(:date_from) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :be).must_equal 'дзень таму' }
      end

      describe 'date DataTime type' do
        let(:date) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :be).must_equal 'праз 23 гадзіны' }
      end
    end

    describe 'when difference in seconds' do
      it { RelativeTime.in_words(date, locale: :be).must_equal      'менш хвіліны таму' }

      it { RelativeTime.in_words(date - 10, locale: :be).must_equal 'менш хвіліны таму' }
      it { RelativeTime.in_words(date + 10, locale: :be).must_equal 'менш хвіліны таму' }

      it { RelativeTime.in_words(date - 59, locale: :be).must_equal 'менш хвіліны таму' }
      it { RelativeTime.in_words(date + 59, locale: :be).must_equal 'менш хвіліны таму' }
    end

    describe 'when difference in minutes' do
      it { RelativeTime.in_words(date - 70, locale: :be).must_equal 'хвіліну таму' }
      it { RelativeTime.in_words(date + 70, locale: :be).must_equal 'праз хвіліну' }

      it { RelativeTime.in_words(date - 1  * minute, locale: :be).must_equal  'хвіліну таму' }
      it { RelativeTime.in_words(date - 3  * minute, locale: :be).must_equal  '3 хвіліны таму' }
      it { RelativeTime.in_words(date - 20 * minute, locale: :be).must_equal '20 хвілін таму' }
      it { RelativeTime.in_words(date - 59 * minute, locale: :be).must_equal '59 хвілін таму' }

      it { RelativeTime.in_words(date + 1  * minute, locale: :be).must_equal 'праз хвіліну' }
      it { RelativeTime.in_words(date + 3  * minute, locale: :be).must_equal 'праз 3 хвіліны' }
      it { RelativeTime.in_words(date + 20 * minute, locale: :be).must_equal 'праз 20 хвілін' }
      it { RelativeTime.in_words(date + 59 * minute, locale: :be).must_equal 'праз 59 хвілін' }
    end

    describe 'when difference in hours' do
      it { RelativeTime.in_words(date - 70 * minute, locale: :be).must_equal  'гадзіну таму' }
      it { RelativeTime.in_words(date + 70 * minute, locale: :be).must_equal  'праз гадзіну' }

      it { RelativeTime.in_words(date - 60 * minute, locale: :be).must_equal  'гадзіну таму' }
      it { RelativeTime.in_words(date + 60 * minute, locale: :be).must_equal  'праз гадзіну' }

      it { RelativeTime.in_words(date - 1  * hour, locale: :be).must_equal  'гадзіну таму' }
      it { RelativeTime.in_words(date - 3  * hour, locale: :be).must_equal  '3 гадзіны таму' }
      it { RelativeTime.in_words(date - 10 * hour, locale: :be).must_equal '10 гадзін таму' }
      it { RelativeTime.in_words(date - 23 * hour, locale: :be).must_equal '23 гадзіны таму' }

      it { RelativeTime.in_words(date + 1  * hour, locale: :be).must_equal 'праз гадзіну' }
      it { RelativeTime.in_words(date + 3  * hour, locale: :be).must_equal 'праз 3 гадзіны' }
      it { RelativeTime.in_words(date + 10 * hour, locale: :be).must_equal 'праз 10 гадзін' }
      it { RelativeTime.in_words(date + 23 * hour, locale: :be).must_equal 'праз 23 гадзіны' }
    end

    describe 'when difference in days' do
      it { RelativeTime.in_words(date - 24 * hour, locale: :be).must_equal  'дзень таму' }
      it { RelativeTime.in_words(date + 24 * hour, locale: :be).must_equal  'праз дзень' }

      it { RelativeTime.in_words(date - 1 * day, locale: :be).must_equal 'дзень таму' }
      it { RelativeTime.in_words(date - 3 * day, locale: :be).must_equal '3 дні таму' }
      it { RelativeTime.in_words(date - 6 * day, locale: :be).must_equal '6 дзён таму' }

      it { RelativeTime.in_words(date + 1 * day, locale: :be).must_equal 'праз дзень' }
      it { RelativeTime.in_words(date + 3 * day, locale: :be).must_equal 'праз 3 дні' }
      it { RelativeTime.in_words(date + 6 * day, locale: :be).must_equal 'праз 6 дзён' }
    end

    describe 'when difference in weeks' do
      it { RelativeTime.in_words(date - 7 * day, locale: :be).must_equal  'тыдзень таму' }
      it { RelativeTime.in_words(date + 7 * day, locale: :be).must_equal  'праз тыдзень' }

      it { RelativeTime.in_words(date - 8 * day, locale: :be).must_equal  'тыдзень таму' }
      it { RelativeTime.in_words(date + 8 * day, locale: :be).must_equal  'праз тыдзень' }

      it { RelativeTime.in_words(date - 1 * week, locale: :be).must_equal 'тыдзень таму' }
      it { RelativeTime.in_words(date - 3 * week, locale: :be).must_equal '3 тыдні таму' }

      it { RelativeTime.in_words(date + 1 * week, locale: :be).must_equal 'праз тыдзень' }
      it { RelativeTime.in_words(date + 3 * week, locale: :be).must_equal 'праз 3 тыдні' }
    end

    describe 'when difference in months' do
      it { RelativeTime.in_words(date - 4 * week, locale: :be).must_equal 'месяц таму' }
      it { RelativeTime.in_words(date + 4 * week, locale: :be).must_equal 'праз месяц' }

      it { RelativeTime.in_words(date - 6 * week, locale: :be).must_equal 'месяц таму' }
      it { RelativeTime.in_words(date + 6 * week, locale: :be).must_equal 'праз месяц' }

      it { RelativeTime.in_words(date - 1  * month, locale: :be).must_equal 'месяц таму' }
      it { RelativeTime.in_words(date - 3 * month, locale: :be).must_equal '3 месяцы таму' }
      it { RelativeTime.in_words(date - 11 * month, locale: :be).must_equal '11 месяцаў таму' }

      it { RelativeTime.in_words(date + 1  * month, locale: :be).must_equal 'праз месяц' }
      it { RelativeTime.in_words(date + 3  * month, locale: :be).must_equal 'праз 3 месяцы' }
      it { RelativeTime.in_words(date + 11 * month, locale: :be).must_equal 'праз 11 месяцаў' }
    end

    describe 'when difference in years' do
      it { RelativeTime.in_words(date - 12 * month, locale: :be).must_equal 'год таму' }
      it { RelativeTime.in_words(date + 12 * month, locale: :be).must_equal 'праз год' }

      it { RelativeTime.in_words(date - 14 * month, locale: :be).must_equal 'год таму' }
      it { RelativeTime.in_words(date + 14 * month, locale: :be).must_equal 'праз год' }

      it { RelativeTime.in_words(date - 1  * year, locale: :be).must_equal 'год таму' }
      it { RelativeTime.in_words(date - 3  * year, locale: :be).must_equal '3 года таму' }
      it { RelativeTime.in_words(date - 11 * year, locale: :be).must_equal '11 гадоў таму' }

      it { RelativeTime.in_words(date + 1  * year, locale: :be).must_equal 'праз год' }
      it { RelativeTime.in_words(date + 3  * year, locale: :be).must_equal 'праз 3 года' }
      it { RelativeTime.in_words(date + 11 * year, locale: :be).must_equal 'праз 11 гадоў' }
    end
  end
end
