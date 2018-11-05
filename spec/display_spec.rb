require 'display'

describe Display do
  describe '#join_line' do
    it 'returns the headers of a bank statement' do
      expect(subject.join_line(Display::HEADINGS)).to eq 'date || credit || debit || balance'
    end

    it 'returns a line of date/credit/debit/balance' do
      transaction = ['10/01/12', nil, '500.00', '2500.00']
      expect(subject.join_line(transaction)).to eq '10/01/12 ||  || 500.00 || 2500.00'
    end
  end
end
