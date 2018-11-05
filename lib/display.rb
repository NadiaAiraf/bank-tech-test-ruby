class Display
  HEADINGS = %w[date credit debit balance].freeze

  def print_statement(account)
    statement_text = join_line(HEADINGS)
    account_array = account.account_history.all_transactions
    statement_text += "\n" + account_history_line(account_array).join("\n")
    return statement_text
  end

  def account_history_line(array)
    array.map{ |element| join_line(element.values) }
  end

  def join_line(array)
    array.join(' || ')
  end
end
