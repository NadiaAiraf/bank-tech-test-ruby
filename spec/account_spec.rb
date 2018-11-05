require 'account'

describe Account do
  let(:mockAccountHistory) { double :history, cr_transaction: nil }
  subject { described_class.new(mockAccountHistory) }

  describe '#deposit' do
    it 'adds £500 to the current balance' do
      subject.deposit(500.00)
      expect(subject.current_balance).to eq 500.00
    end

    it 'adds £1000 to the current balance' do
      subject.deposit(1000.00)
      expect(subject.current_balance).to eq 1000.00
    end

    it 'adds £20.50 to the current balance' do
      subject.deposit(20.50)
      expect(subject.current_balance).to eq 20.50
    end

    it 'calls the method credit_transaction' do
      subject.deposit(1000)
      expect(subject.account_history).to have_received(:cr_transaction)
    end
  end

  describe '#withdraw' do
    it 'withdraws 500 from the account' do
      subject.deposit(5000.00)
      subject.withdraw(500.00)
      expect(subject.current_balance).to eq 4500.00
    end

    it 'withdraws 75.69 from the account' do
      subject.deposit(5000.00)
      subject.withdraw(75.69)
      expect(subject.current_balance).to eq 4924.31
    end

    it 'errors when no money is in the account' do
      expect { subject.withdraw(100) }.to raise_error 'Insufficient funds'
    end

    it 'calls the method dr_transaction' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.account_history).to have_received(:dr_transaction)
    end

    it 'errors when money in account is not sufficient is in the account' do
      subject.deposit(100)
      expect { subject.withdraw 101 }.to raise_error 'Insufficient funds'
    end
  end
end
