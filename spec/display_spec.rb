require 'display'

describe Display do
  let(:mockAccount) { double :account, account_history: mockAccountHistory }
  let(:mockAccountHistory) { double :account, all_transactions: [{
                                              date: '14/01/12',
                                              credit: '200.23',
                                              debit: nil,
                                              balance: '500.52'
                                              }] }

  describe '#join_line' do
    it 'returns the headers of a bank statement' do
      expect(subject.join_line(Display::HEADINGS)).to eq 'date || credit || debit || balance'
    end

    it 'returns a line of date/credit/debit/balance' do
      transaction = ['10/01/12', nil, '500.00', '2500.00']
      expect(subject.join_line(transaction)).to eq '10/01/12 ||  || 500.00 || 2500.00'
    end
  end

  describe '#print_statement' do
    it 'takes a users account and returns their statement' do
      statement = "date || credit || debit || balance\n14/01/12 || 200.23 ||  || 500.52"
      expect(subject.print_statement(mockAccount)).to eq statement
    end
  end

  describe '#account_history_line' do
    it 'takes an array of hashes and returns array of arrays' do
      hash_array = [{ date: '1/1/1', credit: '200.00', debit: nil, balance: '2500.00' },
                    { date: '2/2/2', credit: '300.00', debit: nil, balance: '2800.00' },
                    { date: '3/3/3', credit: '100.00', debit: nil, balance: '2900.00' }]
      answer_array = ["1/1/1 || 200.00 ||  || 2500.00",
                      "2/2/2 || 300.00 ||  || 2800.00",
                      "3/3/3 || 100.00 ||  || 2900.00"]
      expect(subject.account_history_line(hash_array)).to eq answer_array
    end
  end
end
