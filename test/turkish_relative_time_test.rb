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
      it { RelativeTime.in_words(date, date_from, locale: :tr).must_equal '1 saat önce' }

      describe 'with both DateTime type' do
        let(:date) { DateTime.new(2017, 1, 15, 11, 0) }
        let(:date_from) { DateTime.new(2017, 1, 18, 15, 0) }

        it { RelativeTime.in_words(date, date_from, locale: :tr).must_equal '3 gün önce' }
      end

      describe 'date_from DateTime type' do
        let(:date_from) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :tr).must_equal '1 gün önce' }
      end

      describe 'date DataTime type' do
        let(:date) { DateTime.now + 1 }

        it { RelativeTime.in_words(date, date_from, locale: :tr).must_equal '23 saat içinde' }
      end
    end

    describe 'when difference in seconds' do
      it { RelativeTime.in_words(date, locale: :tr).must_equal      '1 dakikadan daha az' }

      it { RelativeTime.in_words(date - 10, locale: :tr).must_equal '1 dakikadan daha az' }
      it { RelativeTime.in_words(date + 10, locale: :tr).must_equal '1 dakikadan daha az' }

      it { RelativeTime.in_words(date - 59, locale: :tr).must_equal '1 dakikadan daha az' }
      it { RelativeTime.in_words(date + 59, locale: :tr).must_equal '1 dakikadan daha az' }
    end

    describe 'when difference in minutes' do
      it { RelativeTime.in_words(date - 70, locale: :tr).must_equal '1 dakika önce' }
      it { RelativeTime.in_words(date + 70, locale: :tr).must_equal '1 dakika içinde' }

      it { RelativeTime.in_words(date - 1  * minute, locale: :tr).must_equal  '1 dakika önce' }
      it { RelativeTime.in_words(date - 3  * minute, locale: :tr).must_equal  '3 dakika önce' }
      it { RelativeTime.in_words(date - 20 * minute, locale: :tr).must_equal '20 dakika önce' }
      it { RelativeTime.in_words(date - 59 * minute, locale: :tr).must_equal '59 dakika önce' }

      it { RelativeTime.in_words(date + 1  * minute, locale: :tr).must_equal '1 dakika içinde' }
      it { RelativeTime.in_words(date + 3  * minute, locale: :tr).must_equal '3 dakika içinde' }
      it { RelativeTime.in_words(date + 20 * minute, locale: :tr).must_equal '20 dakika içinde' }
      it { RelativeTime.in_words(date + 59 * minute, locale: :tr).must_equal '59 dakika içinde' }
    end

    describe 'when difference in hours' do
      it { RelativeTime.in_words(date - 70 * minute, locale: :tr).must_equal  '1 saat önce' }
      it { RelativeTime.in_words(date + 70 * minute, locale: :tr).must_equal  '1 saat içinde' }

      it { RelativeTime.in_words(date - 60 * minute, locale: :tr).must_equal  '1 saat önce' }
      it { RelativeTime.in_words(date + 60 * minute, locale: :tr).must_equal  '1 saat içinde' }

      it { RelativeTime.in_words(date - 1  * hour, locale: :tr).must_equal  '1 saat önce' }
      it { RelativeTime.in_words(date - 3  * hour, locale: :tr).must_equal  '3 saat önce' }
      it { RelativeTime.in_words(date - 10 * hour, locale: :tr).must_equal '10 saat önce' }
      it { RelativeTime.in_words(date - 23 * hour, locale: :tr).must_equal '23 saat önce' }

      it { RelativeTime.in_words(date + 1  * hour, locale: :tr).must_equal '1 saat içinde' }
      it { RelativeTime.in_words(date + 3  * hour, locale: :tr).must_equal '3 saat içinde' }
      it { RelativeTime.in_words(date + 10 * hour, locale: :tr).must_equal '10 saat içinde' }
      it { RelativeTime.in_words(date + 23 * hour, locale: :tr).must_equal '23 saat içinde' }
    end

    describe 'when difference in days' do
      it { RelativeTime.in_words(date - 24 * hour, locale: :tr).must_equal  '1 gün önce' }
      it { RelativeTime.in_words(date + 24 * hour, locale: :tr).must_equal  '1 gün içinde' }

      it { RelativeTime.in_words(date - 1 * day, locale: :tr).must_equal '1 gün önce' }
      it { RelativeTime.in_words(date - 3 * day, locale: :tr).must_equal '3 gün önce' }
      it { RelativeTime.in_words(date - 6 * day, locale: :tr).must_equal '6 gün önce' }

      it { RelativeTime.in_words(date + 1 * day, locale: :tr).must_equal '1 gün içinde' }
      it { RelativeTime.in_words(date + 3 * day, locale: :tr).must_equal '3 gün içinde' }
      it { RelativeTime.in_words(date + 6 * day, locale: :tr).must_equal '6 gün içinde' }
    end

    describe 'when difference in weeks' do
      it { RelativeTime.in_words(date - 7 * day, locale: :tr).must_equal  '1 hafta önce' }
      it { RelativeTime.in_words(date + 7 * day, locale: :tr).must_equal  '1 hafta içinde' }

      it { RelativeTime.in_words(date - 8 * day, locale: :tr).must_equal  '1 hafta önce' }
      it { RelativeTime.in_words(date + 8 * day, locale: :tr).must_equal  '1 hafta içinde' }

      it { RelativeTime.in_words(date - 1 * week, locale: :tr).must_equal '1 hafta önce' }
      it { RelativeTime.in_words(date - 3 * week, locale: :tr).must_equal '3 hafta önce' }

      it { RelativeTime.in_words(date + 1 * week, locale: :tr).must_equal '1 hafta içinde' }
      it { RelativeTime.in_words(date + 3 * week, locale: :tr).must_equal '3 hafta içinde' }
    end

    describe 'when difference in months' do
      it { RelativeTime.in_words(date - 4 * week, locale: :tr).must_equal '1 ay önce' }
      it { RelativeTime.in_words(date + 4 * week, locale: :tr).must_equal '1 ay içinde' }

      it { RelativeTime.in_words(date - 6 * week, locale: :tr).must_equal '1 ay önce' }
      it { RelativeTime.in_words(date + 6 * week, locale: :tr).must_equal '1 ay içinde' }

      it { RelativeTime.in_words(date - 1  * month, locale: :tr).must_equal '1 ay önce' }
      it { RelativeTime.in_words(date - 11 * month, locale: :tr).must_equal '11 ay önce' }

      it { RelativeTime.in_words(date + 1  * month, locale: :tr).must_equal '1 ay içinde' }
      it { RelativeTime.in_words(date + 11 * month, locale: :tr).must_equal '11 ay içinde' }
    end

    describe 'when difference in years' do
      it { RelativeTime.in_words(date - 12 * month, locale: :tr).must_equal '1 yıl önce' }
      it { RelativeTime.in_words(date + 12 * month, locale: :tr).must_equal '1 yıl içinde' }

      it { RelativeTime.in_words(date - 14 * month, locale: :tr).must_equal '1 yıl önce' }
      it { RelativeTime.in_words(date + 14 * month, locale: :tr).must_equal '1 yıl içinde' }

      it { RelativeTime.in_words(date - 1  * year, locale: :tr).must_equal '1 yıl önce' }
      it { RelativeTime.in_words(date - 11 * year, locale: :tr).must_equal '11 yıl önce' }

      it { RelativeTime.in_words(date + 1  * year, locale: :tr).must_equal '1 yıl içinde' }
      it { RelativeTime.in_words(date + 11 * year, locale: :tr).must_equal '11 yıl içinde' }
    end
  end
end
