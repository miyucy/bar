def content(idx, lo, hi)
  <<EOF
RSpec.describe '#{idx}' do
  it 'works' do
    sleep(rand((#{lo})..(#{hi})) / 1000.0)
    expect(1).to eq 1
  end
end
EOF
end

idx = 0

# 10% 0.5-1sec
10.times do
  fn = '%03d_spec.rb' % idx
  File.write fn, content(idx, 500, 1 * 1000)
  idx += 1
end

# 70% 2-3sec
70.times do
  fn = '%03d_spec.rb' % idx
  File.write fn, content(idx, 2 * 1000, 3 * 1000)
  idx += 1
end

# 20% 5-6sec
20.times do
  fn = '%03d_spec.rb' % idx
  File.write fn, content(idx, 5 * 1000, 6 * 1000)
  idx += 1
end
