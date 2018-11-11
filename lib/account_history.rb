class AccountHistory
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def cr_transaction(t_amount, t_bal)
    @all_transactions.push(date: Time.now,
                           cr: t_amount,
                           dr: nil,
                           bal: t_bal)
  end

  def dr_transaction(t_amount, t_bal)
    @all_transactions.push(date: Time.now,
                           cr: nil,
                           dr: t_amount,
                           bal: t_bal)
  end
end
