require 'account'
require 'display'

RSpec.describe 'User interface' do
  it 'lets a user deposit then shows those deposits' do
    answer = "date || credit || debit || balance\n"\
             "01/01/18 || 450.73 ||  || 450.73\n"
    account = Account.new
    account.deposit(450.73,'01/01/18')
    expect{ Display.print_statement(account) }.to output(answer).to_stdout
  end

  it 'lets a user deposit and withdraw then shows those on the statement' do
    answer = "date || credit || debit || balance\n"\
             "02/01/18 ||  || 385.25 || 65.48\n"\
             "01/01/18 || 450.73 ||  || 450.73\n"
    account = Account.new
    account.deposit(450.73,'01/01/18')
    account.withdraw(385.25,'02/01/18')
    expect{ Display.print_statement(account) }.to output(answer).to_stdout
  end
end
