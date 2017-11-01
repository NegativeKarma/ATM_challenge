require 'date'

class Account
  attr_accessor :pin_code, :balance, :account_status, :exp_date, :account_owner

  STANDARD_VALIDITY_YRS = 5

  def initialize
    @pin_code = rand(1000..9999)
    @balance = 0
    @exp_date = set_expire_date
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

end
