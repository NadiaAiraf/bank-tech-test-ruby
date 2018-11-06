class Display
  HEADINGS = %w[date credit debit balance].freeze

  def self.print_statement(account)
    statement_text = join_line(HEADINGS)
    account_array = account.account_transactions
    statement_text += "\n" + account_history_line(account_array).join("\n")
    puts statement_text
  end

  def self.account_history_line(array)
    array.map { |element| join_line(element.values) }.reverse
  end

  def self.join_line(array)
    array.join(' || ')
  end
end
