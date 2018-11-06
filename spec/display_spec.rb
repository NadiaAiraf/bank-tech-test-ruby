require 'display'

describe Display do
  let(:mockAccount) do
    double :account, get_transactions: [{
      date: '14/01/12',
      cr: '200.23',
      dr: nil,
      bal: '500.52'
    }]
  end

  describe '#join_line' do
    it 'returns the headers of a bank statement' do
      answer = 'date || credit || debit || balance'
      expect(Display.join_line(Display::HEADINGS)).to eq answer
    end

    it 'returns a line of date/credit/debit/balance' do
      transaction = ['10/01/12', nil, '500.00', '2500.00']
      answer = '10/01/12 ||  || 500.00 || 2500.00'
      expect(Display.join_line(transaction)).to eq answer
    end
  end

  describe '#print_statement' do
    it 'takes a users account and returns their statement' do
      statement = "date || credit || debit || balance\n"\
                  '14/01/12 || 200.23 ||  || 500.52'
      expect(Display.print_statement(mockAccount)).to eq statement
    end
  end

  describe '#account_history_line' do
    it 'takes an array of hashes and returns array of arrays in reverse' do
      hash_array = [{ date: '1/1/1', cr: '200.00', dr: nil, bal: '2500.00' },
                    { date: '2/2/2', cr: '300.00', dr: nil, bal: '2800.00' },
                    { date: '3/3/3', cr: '100.00', dr: nil, bal: '2900.00' }]
      answer_array = ['3/3/3 || 100.00 ||  || 2900.00',
                      '2/2/2 || 300.00 ||  || 2800.00',
                      '1/1/1 || 200.00 ||  || 2500.00']
      expect(Display.account_history_line(hash_array)).to eq answer_array
    end
  end
end
