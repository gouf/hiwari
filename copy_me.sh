# Bash function
function work_day_per_salary {
  currentDir=$(pwd)
  month=$1

  cd "$HOME/hiwari"
  # NOTE: 2024年固定なので、時間経過で年数を更新する必要がある
  bundle e ruby -e "require_relative 'lib/work_days_per_salary';puts (WorkDaysPerSalary.new(date: Date.new(2024, ARGV[0].to_i, 1), amount: 600_000)).salary_per_day" $month
  cd "$currentDir"
}
