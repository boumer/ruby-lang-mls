require 'minitest/autorun'
require 'lib/mlrequest'


describe MLRequest do

  it 'returns empty strings for missing or nil request parameters' do
    @request = MLRequest.new({ :list => nil })
    @request.list.must_equal ''
    @request.email.must_equal ''
    @request.action.must_equal ''
  end

  it 'can validate a valid request' do
    @request = MLRequest.new({
                 :list   => 'ruby-talk',
                 :email  => 'john.doe@test.org',
                 :action => 'subscribe'
               })
    @request.valid?.must_equal true
  end

  it 'can validate an invalid request' do
    @request = MLRequest.new({
                 :list   => 'ruby-talk',
                 :action => 'subscribe'
               })
    @request.valid?.must_equal false
  end
end
