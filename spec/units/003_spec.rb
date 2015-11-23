RSpec.describe '3' do
  it 'works' do
    sleep(rand((500)..(1000)) / 1000.0)
    expect(1).to eq 1
  end
end
