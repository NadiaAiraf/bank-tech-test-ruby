require 'display'

describe Display do
  let(:mockAccount) do
    double :account, account_transactions: [{
      date: '14/01/12',
      cr: '200.23',
      dr: nil,
      bal: '500.52'
    }]
  end

  describe '#print_line' do
    it 'returns a line of date/credit/debit/balance' do
      transaction = { date: '1/1/1', cr: '200.00', dr: nil, bal: '2500.00' }
      answer = "1/1/1 || 200.00 ||  || 2500.00\n"
      expect{ Display.print_line(transaction) }.to output(answer).to_stdout
    end
  end

  describe '#print_statement' do
    it 'takes a users account and returns their statement' do
      statement = "date || credit || debit || balance\n"\
                  "14/01/12 || 200.23 ||  || 500.52\n"
      expect { Display.print_statement(mockAccount) }.to output(statement).to_stdout
    end
  end
end
