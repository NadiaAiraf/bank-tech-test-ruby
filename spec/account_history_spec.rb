require 'account_history'

describe AccountHistory do
  describe '#credit_transaction' do
    it 'adds a credit transaction to the account history array' do
      subject.credit_transaction('14/01/12', 200, 500)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                              credit: '200.00',
                                              debit: nil,
                                              balance: '500.00' }]
    end

    it 'keeps 2 decimal places when transferred into the arary' do
      subject.credit_transaction('14/01/12', 200.23, 500.52)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                              credit: '200.23',
                                              debit: nil,
                                              balance: '500.52' }]
    end
  end

  describe '#credit_transaction' do
    it 'adds a debit transaction to the account history array' do
      subject.debit_transaction('14/01/12', 200, 500)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                              credit: nil,
                                              debit: '200.00',
                                              balance: '500.00' }]
    end

    it 'keeps 2 decimal places when converted to strings' do
      subject.debit_transaction('14/01/12', 200.50, 500.00)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                              credit: nil,
                                              debit: '200.50',
                                              balance: '500.00' }]
    end
  end
end
