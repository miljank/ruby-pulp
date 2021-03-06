$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'pulp'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha
end

class DummyResult
  def self.body
    JSON.dump(real_body)
  end
  
  def self.real_body
    { 'a' => 1 }
  end
end

class UnparsedDummyResult
  def self.body
    "True"
  end

  def self.real_body
    body
  end
end