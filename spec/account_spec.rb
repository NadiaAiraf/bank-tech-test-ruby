require 'account'

describe Account do
  let(:mockAccountHistory) do
    double :history,
           cr_transaction: nil,
           dr_transaction: nil,
           all_transactions: nil
  end
  subject { described_class.new(mockAccountHistory) }

  describe '#deposit' do
    it 'adds £500 to the current balance' do
      subject.deposit(500.00, '25/12/18')
      expect(subject.current_balance).to eq 500.00
    end

    it 'adds £1000 to the current balance' do
      subject.deposit(1000.00, '25/12/18')
      expect(subject.current_balance).to eq 1000.00
    end

    it 'adds £20.50 to the current balance' do
      subject.deposit(20.50, '25/12/18')
      expect(subject.current_balance).to eq 20.50
    end

    it 'calls the method credit_transaction' do
      subject.deposit(1000, '25/12/18')
      expect(subject.account_history).to have_received(:cr_transaction)
    end
  end

  describe '#withdraw' do
    it 'withdraws 500 from the account' do
      subject.deposit(5000.00, '25/12/18')
      subject.withdraw(500.00, '25/12/18')
      expect(subject.current_balance).to eq 4500.00
    end

    it 'withdraws 75.69 from the account' do
      subject.deposit(5000.00, '25/12/18')
      subject.withdraw(75.69, '25/12/18')
      expect(subject.current_balance).to eq 4924.31
    end

    it 'errors when no money is in the account' do
      expect { subject.withdraw(100, '25/12/18') }.to raise_error 'Insufficient funds'
    end

    it 'calls the method dr_transaction' do
      subject.deposit(1000, '25/12/18')
      subject.withdraw(500, '25/12/18')
      expect(subject.account_history).to have_received(:dr_transaction)
    end

    it 'errors when money in account is not sufficient is in the account' do
      subject.deposit(100, '25/12/18')
      expect { subject.withdraw(101, '25/12/18') }.to raise_error 'Insufficient funds'
    end
  end

  describe '#get_transactions' do
    it 'calls the all_transactions method from the AccountHistory instance' do
      subject.get_transactions
      expect(subject.account_history).to have_received(:all_transactions)
    end
  end
end
