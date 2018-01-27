require 'rails_helper'

RSpec.describe 'Definitions API' do
  let!(:word) { create(:word) }
  let!(:definitions) { create_list(:definition, 10, word_id: word.id) }
  let(:word_id) { word.id }
  let(:id) { definitions.first.id }

  describe 'GET /words/:word_id/definitions' do
    before { get "words/#{word_id}/definitions" }

    context 'when word exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all word items' do
        expect(json.size).to eq(10)
      end
    end

    context 'when word does not exist' do
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Word/)
      end
    end
  end

  describe 'GET /words/:word_id/definitions/:id' do
    before { get "/words/#{word_id}/definitions/#{id}" }

    context 'when word definition exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when word definition does not exist' do
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Definition/)
      end
    end
  end

  describe 'POST /words/:word_id/definitions' do
    let(:valid_attributes) { { 'name' => 'TEST DEFINITION' } }

    context 'when request attributes are valid' do
      before { post "/words/#{word_id}/definitions", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request attributes are not valid' do
      before { post "/words/#{word_id}/definitions", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /words/:word_id/definitions/:id' do
    let(:valid_attributes) { { 'name' => 'TEST' } }

    before { put "/words/#{word_id}/definitions/#{id}"}

    context 'when definition exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the definition' do
        updated_definition = Definition.find(id)
        expect(updated_definition.name).to match(/TEST/)
      end
    end

    context 'when the definition does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Definition/)
      end
    end
  end

  describe 'DELETE /words/:word_id/definitions/:id' do
    before { delete "/words/#{word_id}/definitions/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
