class Display
  HEADINGS = ['date', 'credit', 'debit', 'balance']

  def self.print_statement(account)
    puts HEADINGS.join(' || ')
    account_array = account.transactions_reversed
    account_array.each { |element| print_line(element) }
  end

  def self.print_line(hash)
    puts hash.values.join(' || ')
  end
end
