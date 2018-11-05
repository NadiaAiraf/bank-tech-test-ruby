require 'display'

describe Display do
  describe '#return_header' do
    it 'returns the headers of a bank statement' do
      expect(subject.return_header).to eq 'date || credit || debit || balance'
    end
  end
end
