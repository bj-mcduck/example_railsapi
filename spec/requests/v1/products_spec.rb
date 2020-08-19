require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /v1/products" do
    # I'd love to add openapi validation with a custom gem my co-worker and I
    # have been working on but it hasn't been made for Rails 6 yet
    # See: https://github.com/tractionguest/rspec_contracts
    it "returns records" do
      get v1_products_path
      expect(response).to have_http_status(200)
    end
  end
end
