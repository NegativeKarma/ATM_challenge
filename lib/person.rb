require './lib/account'
require './lib/atm'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil
  end

  def create_account
    @account = Account.new({owner: self})
  end

  def deposit_funds(amount)
    @account == nil ? no_account : deposit_cash(amount)
  end

  def withdraw(args = {})
    @account == nil ? no_account : withdraw_funds(args)
  end

  private

  def deposit_cash(amount)
    @cash -= amount
    @account.balance += amount
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args [:atm]
    account = @account
    amount = args[:amount]
    pin = args [:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def set_name(name)
    if name == nil
      raise 'Name required'
    else
      @name = name
    end
  end

  def no_account
      raise 'No account present'
  end

  def missing_atm
    raise RuntimeError, 'ATM required'
  end

end
