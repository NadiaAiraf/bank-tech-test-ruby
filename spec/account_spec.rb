require 'account'

describe Account do
  describe '#deposit' do
    it 'adds £500 to the current balance' do
      subject.deposit(500.00)
      expect(subject.current_balance).to eq (500.00)
    end

    it 'adds £1000 to the current balance' do
      subject.deposit(1000.00)
      expect(subject.current_balance).to eq (1000.00)
    end

    it 'adds £20.50 to the current balance' do
      subject.deposit(20.50)
      expect(subject.current_balance).to eq (20.50)
    end
  end

  describe '#withdraw' do
    it 'withdraws 500 from the account' do
      subject.deposit(5000.00)
      subject.withdraw(500.00)
      expect(subject.current_balance).to eq (4500.00)
    end

    it 'withdraws 75.69 from the account' do
      subject.deposit(5000.00)
      subject.withdraw(75.69)
      expect(subject.current_balance).to eq (4924.31)
    end
  end
end
