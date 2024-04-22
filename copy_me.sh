# Bash function
function work_day_per_salary {
  currentDir=$(pwd)
  projectDir="$HOME/hiwari" # hiwari があるディレクトリを指定
  targetYear=$(date +%Y) # 今年の年数
  targetMonth=$1 # コマンドで渡す対象の月数
  amount="600_000" # 税抜き報酬額を指定
  requireRelative="require_relative 'lib/work_days_per_salary'"
  requireAndIncludeHelper="require 'action_view/helpers'; include ActionView::Helpers" # gem install actionview
  workdays="WorkDaysPerSalary.new(year: $targetYear, month: ARGV[0].to_i, amount: $amount).workdays"
  salaryPerDay="WorkDaysPerSalary.new(year: $targetYear, month: ARGV[0].to_i, amount: $amount).salary_per_day"

  cd "$projectDir"
  bundle e ruby -e "$requireRelative; $requireAndIncludeHelper; puts \"営業日: #{$workdays}日\"; puts \"日割り額: #{number_with_delimiter($salaryPerDay)}円\"" $targetMonth

  cd "$currentDir"
}

# Usage:
# copy and paste this function to your .bashrc
