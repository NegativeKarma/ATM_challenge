require 'date'

class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    if insufficient_funds_in_account?(amount, account)
      err_msg('insufficient funds in account')
    elsif insufficient_funds_in_atm?(amount)
      err_msg('insufficient funds in ATM')
    elsif incorrect_pin?(pin_code, account.pin_code)
      err_msg('wrong pin')
    elsif card_expired?(account.exp_date)
      err_msg('card expired')
    elsif account_disabled?(account.account_status)
      err_msg('account disabled')
    else
      perform_transaction(amount, account)
    end
  end

  private

  def err_msg(message)
    { status: false,
      message: message,
      date: Date.today }
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance -= amount
    { status: true,
      message: 'success',
      date: Date.today,
      amount: amount,
      bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def account_disabled?(account_status)
    account_status != :active
  end
end
