require 'account_history'

describe AccountHistory do
  before :each do
    Timecop.freeze(Time.local(2012, 1, 14, 10, 5, 0))
  end

  describe '#cr_transaction' do
    it 'adds a credit transaction to the account history array' do
      subject.cr_transaction(200, 500)
      expect(subject.all_transactions).to eq [{ date: Time.now,
                                                cr: 200,
                                                dr: nil,
                                                bal: 500 }]
    end

    it 'keeps 2 decimal places when transferred into the arary' do
      subject.cr_transaction(200.23, 500.52)
      expect(subject.all_transactions).to eq [{ date: Time.now,
                                                cr: 200.23,
                                                dr: nil,
                                                bal: 500.52 }]
    end
  end

  describe '#dr_transaction' do
    it 'adds a dr transaction to the account history array' do
      subject.dr_transaction(200, 500)
      expect(subject.all_transactions).to eq [{ date: Time.now,
                                                cr: nil,
                                                dr: 200,
                                                bal: 500 }]
    end

    it 'keeps 2 decimal places when converted to strings' do
      subject.dr_transaction(200.50, 500.00)
      expect(subject.all_transactions).to eq [{ date: Time.now,
                                                cr: nil,
                                                dr: 200.50,
                                                bal: 500 }]
    end
  end
end
