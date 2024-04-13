require 'holiday_japan'
require 'active_support/all'

class WorkDaysPerSalary
  attr_reader :target_date, :amount

  # 対象の年月, 月あたりの受け取り報酬額
  def initialize(date:, amount:)
    @target_date = date
    @amount = amount
  end

  # 営業日 日数
  def workdays
    (target_date.beginning_of_month..target_date.end_of_month).count { workday?(_1) }
  end

  def salary_per_day
    (amount.to_f / workdays).round.to_i
  end

  private

  # 土日・祝祭日は休み
  def holiday?(date)
    HolidayJapan.check(date) || date.saturday? || date.sunday?
  end

  def workday?(date)
    !holiday?(date)
  end
end
