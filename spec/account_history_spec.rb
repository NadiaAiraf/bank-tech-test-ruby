require 'account_history'

describe AccountHistory do
  describe '#credit_transaction' do
    it "adds a credit transaction to the account history array" do
      subject.credit_transaction('14/01/12', 200, 500)
      expect(subject.account_history).to eq [{ date: '14/01/12',
                                              credit: 200,
                                              balance: 500 }]
    end
  end
end
