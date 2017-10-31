class Account
  attr_accessor :pin_code, :balance, :account_status, :exp_date, :account_owner

  def initialize
    @pin_code = rand(1000..9999)
  end

  def pin_number(pin_code)
    if pin_code > 9999
      {message: 'please enter only 4 digits'}
    elsif pin_code < 1000
      {message: 'please entre more than 4 digits'}
    else
      {message: 'pin correct, checking account status'}
    end
  end

end
