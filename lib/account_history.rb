class AccountHistory
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def credit_transaction(date, t_amount, t_balance)
    @all_transactions.push(date: date, credit: '%.2f' % t_amount, debit: nil, balance: '%.2f' % t_balance)
  end

  def debit_transaction(date, t_amount, t_balance)
    @all_transactions.push(date: date, credit: nil, debit: '%.2f' % t_amount, balance: '%.2f' % t_balance)
  end
end
