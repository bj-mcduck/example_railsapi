require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:products) { FactoryBot.create_list(:product, 3) }
  let(:params) { {} }

  describe "GET /v1/products" do
    # I'd love to add openapi validation with a custom gem my co-worker and I
    # have been working on but it hasn't been tested on Rails 6 yet
    # See: https://github.com/tractionguest/rspec_contracts
    # let(:api_call) { get "/v1/products", params: params, api_operation: api_v1_contract['get-products'] }
    let(:api_call) { get "/v1/products", params: params }
    let!(:product) { create(:product, :with_promotion) }

    before { api_call }

    it "returns records" do
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['products'].length).to eq(4)
      expect(response.parsed_body['pagination']).to be
    end

    context 'with :department_id' do
      let(:params) { { department_id: product.department.id } }

      it "returns only products with the provided department" do
        expect(response.parsed_body['products'].length).to eq(1)
        expect(response.parsed_body['products'].first['id']).to eq(product.id)
      end
    end

    context 'with :promo_code' do
      let(:params) { { promo_code: product.promotions.first.code } }
    end

    context 'with :query' do
      let(:params) { { query: product.name } }
    end
  end
end
