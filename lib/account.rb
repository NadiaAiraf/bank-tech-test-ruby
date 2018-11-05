class Account
  attr_reader :current_balance

  def initialize
    @current_balance = 0.00
  end

  def deposit(num)
    @current_balance += num
  end
end
