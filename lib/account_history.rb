class AccountHistory
  attr_reader :account_history

  def initialize
    @account_history = []
  end

  def credit_transaction(date, t_amount, t_balance)
    @account_history.push({ date: date,
                            credit: t_amount,
                            balance: t_balance })
  end

end
