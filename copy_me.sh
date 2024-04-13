# Bash function
function work_day_per_salary {
  currentDir=$(pwd)
  projectDir="$HOME/hiwari"
  rubyRequire="require_relative 'lib/work_days_per_salary'"
  targetYear=2024
  targetMonth=$1
  amount="600_000" # 税抜き報酬額
  salaryPerDay="WorkDaysPerSalary.new(date: Date.new($targetYear, ARGV[0].to_i, 1), amount: $amount).salary_per_day"

  cd "$projectDir"
  # NOTE: 年数固定なので、時間経過に応じて年数を更新する必要がある
  bundle e ruby -e "$rubyRequire; puts $salaryPerDay" $targetMonth

  cd "$currentDir"
}
