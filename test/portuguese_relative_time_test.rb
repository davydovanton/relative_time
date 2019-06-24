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
      it { RelativeTime.in_words(date, date_from, locale: :pt).must_equal 'há uma hora' }

      describe 'with both DateTime type' do
        let(:date) { DateTime.new(2017, 1, 15, 11, 0) }
        let(:date_from) { DateTime.new(2017, 1, 18, 15, 0) }

        it { RelativeTime.in_words(date, date_from, locale: :pt).must_equal 'há 3 dias' }
      end

      describe 'date_from DateTime type' do
        let(:date_from) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :pt).must_equal 'há um dia' }
      end

      describe 'date DataTime type' do
        let(:date) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :pt).must_equal 'em 23 horas' }
      end
    end

    describe 'when difference in seconds' do
      it { RelativeTime.in_words(date, locale: :pt).must_equal      'menos de um minuto' }

      it { RelativeTime.in_words(date - 10, locale: :pt).must_equal 'menos de um minuto' }
      it { RelativeTime.in_words(date + 10, locale: :pt).must_equal 'menos de um minuto' }

      it { RelativeTime.in_words(date - 59, locale: :pt).must_equal 'menos de um minuto' }
      it { RelativeTime.in_words(date + 59, locale: :pt).must_equal 'menos de um minuto' }
    end

    describe 'when difference in minutes' do
      it { RelativeTime.in_words(date - 70, locale: :pt).must_equal 'há um minuto' }
      it { RelativeTime.in_words(date + 70, locale: :pt).must_equal 'em um minuto' }

      it { RelativeTime.in_words(date - 1  * minute, locale: :pt).must_equal  'há um minuto' }
      it { RelativeTime.in_words(date - 3  * minute, locale: :pt).must_equal  'há 3 minutos' }
      it { RelativeTime.in_words(date - 20 * minute, locale: :pt).must_equal 'há 20 minutos' }
      it { RelativeTime.in_words(date - 59 * minute, locale: :pt).must_equal 'há 59 minutos' }

      it { RelativeTime.in_words(date + 1  * minute, locale: :pt).must_equal 'em um minuto' }
      it { RelativeTime.in_words(date + 3  * minute, locale: :pt).must_equal 'em 3 minutos' }
      it { RelativeTime.in_words(date + 20 * minute, locale: :pt).must_equal 'em 20 minutos' }
      it { RelativeTime.in_words(date + 59 * minute, locale: :pt).must_equal 'em 59 minutos' }
    end

    describe 'when difference in hours' do
      it { RelativeTime.in_words(date - 70 * minute, locale: :pt).must_equal  'há uma hora' }
      it { RelativeTime.in_words(date + 70 * minute, locale: :pt).must_equal  'em uma hora' }

      it { RelativeTime.in_words(date - 60 * minute, locale: :pt).must_equal  'há uma hora' }
      it { RelativeTime.in_words(date + 60 * minute, locale: :pt).must_equal  'em uma hora' }

      it { RelativeTime.in_words(date - 1  * hour, locale: :pt).must_equal  'há uma hora' }
      it { RelativeTime.in_words(date - 3  * hour, locale: :pt).must_equal  'há 3 horas' }
      it { RelativeTime.in_words(date - 10 * hour, locale: :pt).must_equal 'há 10 horas' }
      it { RelativeTime.in_words(date - 23 * hour, locale: :pt).must_equal 'há 23 horas' }

      it { RelativeTime.in_words(date + 1  * hour, locale: :pt).must_equal 'em uma hora' }
      it { RelativeTime.in_words(date + 3  * hour, locale: :pt).must_equal 'em 3 horas' }
      it { RelativeTime.in_words(date + 10 * hour, locale: :pt).must_equal 'em 10 horas' }
      it { RelativeTime.in_words(date + 23 * hour, locale: :pt).must_equal 'em 23 horas' }
    end

    describe 'when difference in days' do
      it { RelativeTime.in_words(date - 24 * hour, locale: :pt).must_equal  'há um dia' }
      it { RelativeTime.in_words(date + 24 * hour, locale: :pt).must_equal  'em um dia' }

      it { RelativeTime.in_words(date - 1 * day, locale: :pt).must_equal 'há um dia' }
      it { RelativeTime.in_words(date - 3 * day, locale: :pt).must_equal 'há 3 dias' }
      it { RelativeTime.in_words(date - 6 * day, locale: :pt).must_equal 'há 6 dias' }

      it { RelativeTime.in_words(date + 1 * day, locale: :pt).must_equal 'em um dia' }
      it { RelativeTime.in_words(date + 3 * day, locale: :pt).must_equal 'em 3 dias' }
      it { RelativeTime.in_words(date + 6 * day, locale: :pt).must_equal 'em 6 dias' }
    end

    describe 'when difference in weeks' do
      it { RelativeTime.in_words(date - 7 * day, locale: :pt).must_equal  'há uma semana' }
      it { RelativeTime.in_words(date + 7 * day, locale: :pt).must_equal  'em uma semana' }

      it { RelativeTime.in_words(date - 8 * day, locale: :pt).must_equal  'há uma semana' }
      it { RelativeTime.in_words(date + 8 * day, locale: :pt).must_equal  'em uma semana' }

      it { RelativeTime.in_words(date - 1 * week, locale: :pt).must_equal 'há uma semana' }
      it { RelativeTime.in_words(date - 3 * week, locale: :pt).must_equal 'há 3 semanas' }

      it { RelativeTime.in_words(date + 1 * week, locale: :pt).must_equal 'em uma semana' }
      it { RelativeTime.in_words(date + 3 * week, locale: :pt).must_equal 'em 3 semanas' }
    end

    describe 'when difference in months' do
      it { RelativeTime.in_words(date - 4 * week, locale: :pt).must_equal 'há um mês' }
      it { RelativeTime.in_words(date + 4 * week, locale: :pt).must_equal 'em um mês' }

      it { RelativeTime.in_words(date - 6 * week, locale: :pt).must_equal 'há um mês' }
      it { RelativeTime.in_words(date + 6 * week, locale: :pt).must_equal 'em um mês' }

      it { RelativeTime.in_words(date - 1  * month, locale: :pt).must_equal 'há um mês' }
      it { RelativeTime.in_words(date - 11 * month, locale: :pt).must_equal 'há 11 meses' }

      it { RelativeTime.in_words(date + 1  * month, locale: :pt).must_equal 'em um mês' }
      it { RelativeTime.in_words(date + 11 * month, locale: :pt).must_equal 'em 11 meses' }
    end

    describe 'when difference in years' do
      it { RelativeTime.in_words(date - 12 * month, locale: :pt).must_equal 'há um ano' }
      it { RelativeTime.in_words(date + 12 * month, locale: :pt).must_equal 'em um ano' }

      it { RelativeTime.in_words(date - 14 * month, locale: :pt).must_equal 'há um ano' }
      it { RelativeTime.in_words(date + 14 * month, locale: :pt).must_equal 'em um ano' }

      it { RelativeTime.in_words(date - 1  * year, locale: :pt).must_equal 'há um ano' }
      it { RelativeTime.in_words(date - 11 * year, locale: :pt).must_equal 'há 11 anos' }

      it { RelativeTime.in_words(date + 1  * year, locale: :pt).must_equal 'em um ano' }
      it { RelativeTime.in_words(date + 11 * year, locale: :pt).must_equal 'em 11 anos' }
    end
  end
end
