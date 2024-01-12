# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get items_url
      expect(response).to be_successful
    end
  end
end
