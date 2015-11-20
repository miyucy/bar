require 'securerandom'

40.times do
  id = SecureRandom.hex
  File.write "#{id}_spec.rb", <<EOF
RSpec.describe '#{id}' do
  it 'works' do
    sleep(rand(1..(1000 * 60) / 1000.0))
    expect(1).to eq 1
  end
end
EOF
end
