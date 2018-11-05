require 'account_history'

describe AccountHistory do
  describe '#cr_transaction' do
    it 'adds a credit transaction to the account history array' do
      subject.cr_transaction('14/01/12', 200, 500)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                                cr: '200.00',
                                                dr: nil,
                                                bal: '500.00' }]
    end

    it 'keeps 2 decimal places when transferred into the arary' do
      subject.cr_transaction('14/01/12', 200.23, 500.52)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                                cr: '200.23',
                                                dr: nil,
                                                bal: '500.52' }]
    end
  end

  describe '#dr_transaction' do
    it 'adds a dr transaction to the account history array' do
      subject.dr_transaction('14/01/12', 200, 500)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                                cr: nil,
                                                dr: '200.00',
                                                bal: '500.00' }]
    end

    it 'keeps 2 decimal places when converted to strings' do
      subject.dr_transaction('14/01/12', 200.50, 500.00)
      expect(subject.all_transactions).to eq [{ date: '14/01/12',
                                                cr: nil,
                                                dr: '200.50',
                                                bal: '500.00' }]
    end
  end
end
