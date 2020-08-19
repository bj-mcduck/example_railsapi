require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:products) { FactoryBot.create_list(:product, 3) }

  describe "GET /v1/products" do
    # I'd love to add openapi validation with a custom gem my co-worker and I
    # have been working on but it hasn't been tested on Rails 6 yet
    # See: https://github.com/tractionguest/rspec_contracts
    it "returns records" do
      get v1_products_path
      expect(response).to have_http_status(200)
      expect(response.parsed_body['products'].length).to eq(3)
      expect(response.parsed_body['pagination']).to be
    end
  end
end
