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
      it { RelativeTime.in_words(date, date_from, locale: :ru).must_equal 'час назад' }

      describe 'with both DateTime type' do
        let(:date) { DateTime.new(2017, 1, 15, 11, 0) }
        let(:date_from) { DateTime.new(2017, 1, 18, 15, 0) }

        it { RelativeTime.in_words(date, date_from, locale: :ru).must_equal '3 дня назад' }
      end

      describe 'date_from DateTime type' do
        let(:date_from) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :ru).must_equal 'день назад' }
      end

      describe 'date DataTime type' do
        let(:date) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :ru).must_equal 'через 23 часа' }
      end
    end

    describe 'when difference in seconds' do
      it { RelativeTime.in_words(date, locale: :ru).must_equal      'меньше минуты назад' }

      it { RelativeTime.in_words(date - 10, locale: :ru).must_equal 'меньше минуты назад' }
      it { RelativeTime.in_words(date + 10, locale: :ru).must_equal 'меньше минуты назад' }

      it { RelativeTime.in_words(date - 59, locale: :ru).must_equal 'меньше минуты назад' }
      it { RelativeTime.in_words(date + 59, locale: :ru).must_equal 'меньше минуты назад' }
    end

    describe 'when difference in minutes' do
      it { RelativeTime.in_words(date - 70, locale: :ru).must_equal 'минуту назад' }
      it { RelativeTime.in_words(date + 70, locale: :ru).must_equal 'через минуту' }

      it { RelativeTime.in_words(date - 1  * minute, locale: :ru).must_equal  'минуту назад' }
      it { RelativeTime.in_words(date - 3  * minute, locale: :ru).must_equal  '3 минуты назад' }
      it { RelativeTime.in_words(date - 20 * minute, locale: :ru).must_equal '20 минут назад' }
      it { RelativeTime.in_words(date - 59 * minute, locale: :ru).must_equal '59 минут назад' }

      it { RelativeTime.in_words(date + 1  * minute, locale: :ru).must_equal 'через минуту' }
      it { RelativeTime.in_words(date + 3  * minute, locale: :ru).must_equal 'через 3 минуты' }
      it { RelativeTime.in_words(date + 20 * minute, locale: :ru).must_equal 'через 20 минут' }
      it { RelativeTime.in_words(date + 59 * minute, locale: :ru).must_equal 'через 59 минут' }
    end

    describe 'when difference in hours' do
      it { RelativeTime.in_words(date - 70 * minute, locale: :ru).must_equal  'час назад' }
      it { RelativeTime.in_words(date + 70 * minute, locale: :ru).must_equal  'через час' }

      it { RelativeTime.in_words(date - 60 * minute, locale: :ru).must_equal  'час назад' }
      it { RelativeTime.in_words(date + 60 * minute, locale: :ru).must_equal  'через час' }

      it { RelativeTime.in_words(date - 1  * hour, locale: :ru).must_equal  'час назад' }
      it { RelativeTime.in_words(date - 3  * hour, locale: :ru).must_equal  '3 часа назад' }
      it { RelativeTime.in_words(date - 10 * hour, locale: :ru).must_equal '10 часов назад' }
      it { RelativeTime.in_words(date - 23 * hour, locale: :ru).must_equal '23 часа назад' }

      it { RelativeTime.in_words(date + 1  * hour, locale: :ru).must_equal 'через час' }
      it { RelativeTime.in_words(date + 3  * hour, locale: :ru).must_equal 'через 3 часа' }
      it { RelativeTime.in_words(date + 10 * hour, locale: :ru).must_equal 'через 10 часов' }
      it { RelativeTime.in_words(date + 23 * hour, locale: :ru).must_equal 'через 23 часа' }
    end

    describe 'when difference in days' do
      it { RelativeTime.in_words(date - 24 * hour, locale: :ru).must_equal  'день назад' }
      it { RelativeTime.in_words(date + 24 * hour, locale: :ru).must_equal  'через день' }

      it { RelativeTime.in_words(date - 1 * day, locale: :ru).must_equal 'день назад' }
      it { RelativeTime.in_words(date - 3 * day, locale: :ru).must_equal '3 дня назад' }
      it { RelativeTime.in_words(date - 6 * day, locale: :ru).must_equal '6 дней назад' }

      it { RelativeTime.in_words(date + 1 * day, locale: :ru).must_equal 'через день' }
      it { RelativeTime.in_words(date + 3 * day, locale: :ru).must_equal 'через 3 дня' }
      it { RelativeTime.in_words(date + 6 * day, locale: :ru).must_equal 'через 6 дней' }
    end

    describe 'when difference in weeks' do
      it { RelativeTime.in_words(date - 7 * day, locale: :ru).must_equal  'неделю назад' }
      it { RelativeTime.in_words(date + 7 * day, locale: :ru).must_equal  'через неделю' }

      it { RelativeTime.in_words(date - 8 * day, locale: :ru).must_equal  'неделю назад' }
      it { RelativeTime.in_words(date + 8 * day, locale: :ru).must_equal  'через неделю' }

      it { RelativeTime.in_words(date - 1 * week, locale: :ru).must_equal 'неделю назад' }
      it { RelativeTime.in_words(date - 3 * week, locale: :ru).must_equal '3 недели назад' }

      it { RelativeTime.in_words(date + 1 * week, locale: :ru).must_equal 'через неделю' }
      it { RelativeTime.in_words(date + 3 * week, locale: :ru).must_equal 'через 3 недели' }
    end

    describe 'when difference in months' do
      it { RelativeTime.in_words(date - 4 * week, locale: :ru).must_equal 'месяц назад' }
      it { RelativeTime.in_words(date + 4 * week, locale: :ru).must_equal 'через месяц' }

      it { RelativeTime.in_words(date - 6 * week, locale: :ru).must_equal 'месяц назад' }
      it { RelativeTime.in_words(date + 6 * week, locale: :ru).must_equal 'через месяц' }

      it { RelativeTime.in_words(date - 1  * month, locale: :ru).must_equal 'месяц назад' }
      it { RelativeTime.in_words(date - 3 * month, locale: :ru).must_equal '3 месяца назад' }
      it { RelativeTime.in_words(date - 11 * month, locale: :ru).must_equal '11 месяцев назад' }

      it { RelativeTime.in_words(date + 1  * month, locale: :ru).must_equal 'через месяц' }
      it { RelativeTime.in_words(date + 3  * month, locale: :ru).must_equal 'через 3 месяца' }
      it { RelativeTime.in_words(date + 11 * month, locale: :ru).must_equal 'через 11 месяцев' }
    end

    describe 'when difference in years' do
      it { RelativeTime.in_words(date - 12 * month, locale: :ru).must_equal 'год назад' }
      it { RelativeTime.in_words(date + 12 * month, locale: :ru).must_equal 'через год' }

      it { RelativeTime.in_words(date - 14 * month, locale: :ru).must_equal 'год назад' }
      it { RelativeTime.in_words(date + 14 * month, locale: :ru).must_equal 'через год' }

      it { RelativeTime.in_words(date - 1  * year, locale: :ru).must_equal 'год назад' }
      it { RelativeTime.in_words(date - 3  * year, locale: :ru).must_equal '3 года назад' }
      it { RelativeTime.in_words(date - 11 * year, locale: :ru).must_equal '11 лет назад' }

      it { RelativeTime.in_words(date + 1  * year, locale: :ru).must_equal 'через год' }
      it { RelativeTime.in_words(date + 3  * year, locale: :ru).must_equal 'через 3 года' }
      it { RelativeTime.in_words(date + 11 * year, locale: :ru).must_equal 'через 11 лет' }
    end
  end
end
