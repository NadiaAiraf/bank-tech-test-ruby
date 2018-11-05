class Display
  HEADINGS = %w[date credit debit balance].freeze

  def print_statement(_account)
    puts 'hello'
  end

  def join_line(array)
    array.join(' || ')
  end
end
