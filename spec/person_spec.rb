require './lib/person'
require './lib/atm'
require './lib/account'

describe Person do
  subject { described_class.new(name: 'Johnny') }

  it 'has a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'raises error if no name is set' do
    expect { described_class.new }.to raise_error 'Name required'
  end

  it 'has a :cash attribute with value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'has a :account attribute' do
    expect(subject.account).to be nil
  end

  describe 'can create an Account' do
    before { subject.create_account }
    it 'of Account class' do
      expect(subject.account).to be_an_instance_of Account
    end

    it 'with himself as an owner' do
      expect(subject.account.owner).to be subject
    end
  end

  describe 'can manage funds if an account has been created' do
    let(:atm) { Atm.new }
    before { subject.create_account }
    it 'can deposit funds' do
      expect(subject.deposit_funds(100)).to be_truthy
    end
    it 'adds funds to account balance and deducts from cash' do
      subject.cash = 100
      subject.deposit_funds(100)
      expect(subject.account.balance).to be 100
      expect(subject.cash).to be 0
    end
    it 'adds funds to cash and deducts from account balance' do
      subject.cash = 100
      subject.deposit_funds(100)
      subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm)
      expect(subject.account.balance).to be 0
      expect(subject.cash).to be 100
    end
    it 'can withdraw funds' do
      command = -> { subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm) }
      expect(command.call).to be_truthy
    end
    it 'withdraw raises error if no ATM is passed in' do
      command = -> { subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account) }
      expect { command.call }.to raise_error 'ATM required'
    end
  end

  describe 'can not manage funds if no account has been created' do
    it 'can\'t deposit funds' do
      expect { subject.deposit_funds(100) }.to raise_error(RuntimeError, 'No account present')
    end
  end
end
