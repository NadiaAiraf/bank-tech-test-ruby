require_relative 'account_history'

class Account
  attr_reader :current_balance, :account_history

  def initialize(account_history = AccountHistory.new)
    @current_balance = 0.00
    @account_history = account_history
  end

  def deposit(amount, time = Time.now)
    @current_balance += amount
    account_history.cr_transaction(time, amount, current_balance)
  end

  def withdraw(amount, time = Time.now)
    raise 'Insufficient funds' if insufficient_funds(amount)
    @current_balance -= amount
    account_history.dr_transaction(time, amount, current_balance)
  end

  private

  def insufficient_funds(amount)
    amount > @current_balance
  end
end
