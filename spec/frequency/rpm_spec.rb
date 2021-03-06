require 'spec_helper'

describe "Frequency/rpm rule request" do
  include Rack::Test::Methods

  it 'should be allowed if not exceed 1 request per min' do
    get '/freq/rpm', {}, {'HTTP_ACCEPT' => "text/html"}
    last_response.body.should show_allowed_response
  end 

  it 'should not be allowed if exceed 1 request per min' do
    2.times { get '/freq/rpm', {}, {'HTTP_ACCEPT' => "text/html"} }
    last_response.body.should show_not_allowed_response
  end 
  
end

