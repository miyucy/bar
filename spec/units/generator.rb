require 'securerandom'

Dir['*_spec.rb'].each do |fn|
  File.write fn, File.read(fn).gsub('rand((0.1)..(5.0))', 'rand(1..(1000 * 60) / 1000.0')
end

__END__
50 * 60

50.times do
  id = SecureRandom.hex
  File.write "#{id}_spec.rb", <<EOF
RSpec.describe '#{id}' do
  it 'works' do
    sleep(rand((0.1)..(5.0)))
    expect(1).to eq 1
  end
end
EOF
end
