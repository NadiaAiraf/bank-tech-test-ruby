require 'display'

describe Display do
  before :each do
    Timecop.freeze(Time.local(2018, 1, 1, 10, 5, 0))
  end

  let(:mockAccount) do
    double :account, transactions_reversed: [{
      date: Time.now,
      cr: '200.23',
      dr: nil,
      bal: '500.52'
    }]
  end

  describe '#print_line' do
    it 'returns a line of date/credit/debit/balance' do
      transaction = { date: Time.now, cr: '200.00', dr: nil, bal: '2500.00' }
      answer = "01/01/2018 || 200.00 ||  || 2500.00\n"
      expect{ Display.print_line(transaction) }.to output(answer).to_stdout
    end
  end

  describe '#print_statement' do
    it 'takes a users account and returns their statement' do
      statement = "date || credit || debit || balance\n"\
                  "01/01/2018 || 200.23 ||  || 500.52\n"
      expect { Display.print_statement(mockAccount) }.to output(statement).to_stdout
    end
  end
end
