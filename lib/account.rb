require 'date'

class Account
  attr_accessor :balance, :account_status, :owner
  attr_reader :pin_code, :exp_date

  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
    @pin_code = rand(1000..9999)
    @balance = 0
    @exp_date = set_expire_date
    @account_status = :active
    @owner = set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  private

  def set_owner(obj)
    obj.nil? ? missing_owner : obj
  end

  def missing_owner
    raise 'Account owner required'
  end
end
