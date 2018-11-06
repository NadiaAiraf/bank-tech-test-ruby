require 'account'
require 'display'

RSpec.describe 'User interface' do
  before :each do
    Timecop.freeze(Time.local(2018, 1, 1, 10, 5, 0))
  end

  it 'lets a user deposit then shows those deposits' do
    answer = "date || credit || debit || balance\n"\
             "01/01/2018 || 450.73 ||  || 450.73\n"
    account = Account.new
    account.deposit(450.73)
    expect { Display.print_statement(account) }.to output(answer).to_stdout
  end

  it 'lets a user deposit and withdraw then shows those on the statement' do
    answer = "date || credit || debit || balance\n"\
             "01/01/2018 ||  || 385.25 || 65.48\n"\
             "01/01/2018 || 450.73 ||  || 450.73\n"
    account = Account.new
    account.deposit(450.73)
    account.withdraw(385.25)
    expect { Display.print_statement(account) }.to output(answer).to_stdout
  end

  it 'will error when you try to take more money than you have' do
    account = Account.new
    account.deposit(450.73)
    error = 'Insufficient funds'
    expect { account.withdraw(999) }.to raise_error error
  end

  it 'fulfils acceptence criteria' do
    answer = "date || credit || debit || balance\n"\
             "14/01/2012 ||  || 500.00 || 2500.00\n"\
             "13/01/2012 || 2000.00 ||  || 3000.00\n"\
             "10/01/2012 || 1000.00 ||  || 1000.00\n"
    account = Account.new
    Timecop.freeze(Time.local(2012, 1, 10))
    account.deposit(1000)
    Timecop.travel(Time.local(2012, 1, 13))
    account.deposit(2000)
    Timecop.travel(Time.local(2012, 1, 14))
    account.withdraw(500)
    expect { Display.print_statement(account) }.to output(answer).to_stdout
  end
end
