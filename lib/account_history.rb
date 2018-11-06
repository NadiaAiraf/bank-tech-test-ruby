class AccountHistory
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def cr_transaction(t_amount, t_bal)
    @all_transactions.push(date: formatted_time,
                           cr: format('%.2f', t_amount),
                           dr: nil,
                           bal: format('%.2f', t_bal))
  end

  def dr_transaction(t_amount, t_bal)
    @all_transactions.push(date: formatted_time,
                           cr: nil,
                           dr: format('%.2f', t_amount),
                           bal: format('%.2f', t_bal))
  end

  def formatted_time
    Time.now.strftime("%d/%m/%Y")
  end
end
