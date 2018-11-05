class Display
  HEADINGS = %w[date credit debit balance].freeze

  def print_statement(account)
    statement_text = join_line(HEADINGS)
    statement_text += "\n" + account_history_line(account).join("\n")
    return statement_text
  end

  def account_history_line(array)
    new_array = array.account_history.all_transactions.map do |element|
      element.map{ |k, v| v }.join(' || ')
    end
    return new_array
  end

  def join_line(array)
    array.join(' || ')
  end
end
