# ATM_challenge

## Project with Ruby, week 1 at Craftacademy

## Introduction to the Project

* The task was to create an ATM machine with basic features to make it able to interact
to a person with an account.

## Gems used

* The Gem used was "rspec" taken from https://rubygems.org

## Getting Started
1. In terminal type `irb`
2. Load the files
* Type: `load './lib/person.rb'`
* Returns `=> true`


## Become a Person
1. Make a new instance of the Person class
* Type: `me = Person.new(name: 'YourName')`
* Returns: `=> #<Person:0x007fdf2a867e80 @cash=0, @account=nil, @name="YourName"> `

2. Create a bank account
* Type: `yourname.create_account`
* Returns: `=> #<Account:0x007fdf2a864a00 @pin_code=6224, @balance=0, @exp_date="11/22", @account_status=:active, @owner="YourName">`

## Deposit Into Account
1. Increase your cash value
* Type: `yourname.cash = 200`
* Returns: `=> 200`

2. Deposit desired amount into account
* Type: `yourname.deposit_funds(100)`
* Returns: `=> 100`

## Withdraw From Account
1. Create an ATM
* Type: `atm = Atm.new`
* Returns: `=> #<Atm:0x007fdf2a87c3f8 @funds=1000>`

2. Withdraw desired amount from account balance
* Type: `yourname.withdraw(atm: atm, account: yourname.account, pin: 6224, amount: 100)`
* Returns: `=> 200` (it's the amount of cash you have now)
