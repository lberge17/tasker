require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "directs user to log in if not logged in or directs looged in user to their home page" do
    get '/'
    expect(last_response.status).to eq(200)
  end
end
