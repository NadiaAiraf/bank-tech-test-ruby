class Account
  attr_reader :current_balance

  def initialize(account_history = AccountHistory.new)
    @current_balance = 0.00
    @account_history = account_history
  end

  def deposit(amount)
    @current_balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds(amount)
    @current_balance -= amount
  end

  private

  def insufficient_funds(amount)
    amount > @current_balance
  end
end
