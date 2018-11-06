class Display
  HEADINGS = ['date', 'credit', 'debit', 'balance']

  def self.print_statement(account)
    puts HEADINGS.join(' || ')
    account_array = account.transactions_reversed
    account_array.each do |element|
      print_line(element)
    end
  end

  def self.print_line(hash)
    puts hash.values.join(' || ')
  end
end
