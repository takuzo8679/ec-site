require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /index" do
    it 'renders a successful response' do
      get items_url
      expect(response).to be_successful
      expect(response).to have_http_status "200"
      end
  end
end
