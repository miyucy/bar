__END__

Dir['*_spec.rb'].each do |fn|
  File.write fn, File.read(fn).gsub('sleep(rand(1..(1000 * 60) / 1000.0))', 'sleep(rand(1..(1000 * 5)) / 1000.0)')
end

__END__
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
