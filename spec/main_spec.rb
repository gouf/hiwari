describe "WorkDaysPerSalary" do
  context '2024年5月' do
    let(:amount) { 600_000 }
    let(:date) { Date.new(2024, 5, 1) }
    let(:main) { WorkDaysPerSalary.new(date: date, amount: amount) }

    it '平日が21日あること' do
      expect(main.workdays).to eq 21
    end

    context '報酬額が60万円/月の場合' do
      it '1日あたりの報酬が約28,571円であること' do
        expect(main.workdays).to eq 21
        expect(main.salary_per_day).to eq 28571
      end
    end
  end

  context '2024年6月' do
    let(:amount) { 600_000 }
    let(:date) { Date.new(2024, 6, 1) }
    let(:main) { WorkDaysPerSalary.new(date: date, amount: amount) }

    it '平日が22日あること' do
      expect(main.workdays).to eq 20
    end

    context '報酬額が60万円/月の場合' do
      it '1日あたりの報酬が約30,000円であること' do
        expect(main.workdays).to eq 20
        expect(main.salary_per_day).to eq 30_000
      end
    end
  end
end
