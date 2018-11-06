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
end
