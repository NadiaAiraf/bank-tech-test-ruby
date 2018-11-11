class Display
  HEADINGS = ['date', 'credit', 'debit', 'balance']

  def self.print_statement(account)
    puts HEADINGS.join(' || ')
    account_array = account.transactions_reversed
    account_array.each { |element| print_line(element) }
  end

  def self.print_line(transaction)
    date = transaction[:date].strftime("%d/%m/%Y")
    cr = format('%.2f', transaction[:cr]) if transaction[:cr]
    dr = format('%.2f', transaction[:dr]) if transaction[:dr]
    bal = format('%.2f', transaction[:bal])
    puts "#{date} || #{cr} || #{dr} || #{bal}"
  end
end
