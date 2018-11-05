require 'account_history'

describe AccountHistory do
  describe '#credit_transaction' do
    it 'adds a credit transaction to the account history array' do
      subject.credit_transaction('14/01/12', 200, 500)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                              credit: 200,
                                              balance: 500 }]
    end
  end

  describe '#credit_transaction' do
    it 'adds a debit transaction to the account history array' do
      subject.debit_transaction('14/01/12', 200, 500)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                              debit: 200,
                                              balance: 500 }]
    end
  end
end
