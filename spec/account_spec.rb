require './lib/account'

describe Account do
  let(:person) { instance_double('Person', name: 'Johnny') }
  subject { described_class.new(owner: person) }

  it 'has an owner' do
    expect(subject.owner).to eq person
  end
  it 'raises error if no owner is set' do
    expect { described_class.new }.to raise_error 'Account owner required'
  end
  it 'is a four numbers code' do
    expect(subject.pin_code.to_s.length).to eq 4
  end
  it 'has 0 balance on initialize' do
    expect(subject.balance).to eq 0
  end
  it 'has an expiry date on intialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end
  it 'has :active status on initialize' do
    expect(subject.account_status).to eq :active
  end
  it 'deactivates account using Instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end
end
