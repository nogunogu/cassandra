# # encoding: utf-8

# Inspec test for recipe cassandra::install

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe package('cassandra') do
  it { should be_installed }
end

describe package('python') do
  it { should be_installed }
end

describe command('java -version') do
  its(:stderr) { should match(/.*1\.8\.*/) }
end

describe command('python -V') do
  its(:stderr) { should match(/Python 2.7.*/) }
end

describe command('cat /etc/os-release | grep VERSION') do
  its(:stdout) { should match(/.*16\.04.*/) }
end

describe command('nodetool status') do
  its(:stdout) { should match(/.*UN .*/) }
  its(:stdout) { should_not match(/.*DN.*/) }
end
