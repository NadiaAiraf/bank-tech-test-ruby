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
end
