require './lib/account'

describe Account do
  it 'is a four numbers code' do
    expect(subject.pin_code.to_s.length).to eq 4
  end
  it 'is expected to have a balance of 0 on initialize' do
    expect(subject.balance).to eq 0
  end

end
