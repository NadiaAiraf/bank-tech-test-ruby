# Bank tech test Ruby

Makers Tech Test Week 10.

This is the first tech test of the week. The aim is to produce the best code you can on the kind of tests that potential employers might give you.

This first test is to mimic some interactions of a bank account, specifically depositing money, withdrawing money and printing a bank statement showing all historical transactions. My approach to the problem can be found lower down.

## How to run

1. clone this repo
2. navigate to the folder in your command line
3. run `bundle install`
4. go into the irb with the `irb` command
5. enter the command `require './lib/account'`
6. enter the command `require './lib/display'`

From this point on you've got everything needed to run the program on the irb shell. If you wanted to run the tests simply use the command `rspec` whilst not in the irb shell. Otherwise please find the 'How to use' section for examples on how to run each command

## How to use

The following assumes you've run steps 1-6 in the 'How to run' section.

if you want to create a new account you can do so as follows
```
2.5.1 :003 > my_account = Account.new
 => #<Account:0x00007fc3b9850528 @current_balance=0.0, @account_history=#<AccountHistory:0x00007fc3b9850500 @all_transactions=[]>>
```

If you would like to deposit money into your account you can do so as follows
```
2.5.1 :004 > my_account.deposit(500,'12/1/18')
 => [{:date=>"12/1/18", :cr=>"500.00", :dr=>nil, :bal=>"500.00"}]
```
