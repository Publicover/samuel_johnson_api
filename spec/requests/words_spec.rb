require 'rails_helper'

RSpec.describe 'Words API' do
  let(:user) { create(:user) }
  let!(:words) { create_list(:word, 20) }
  let(:word_id) { words.first.id }
  let(:definition) { words.first.definition }
  let(:headers) { valid_headers }

  describe 'GET words' do
    before { get '/words', params: {}, headers: headers }

    # test index returning list of 10 random words
    it 'returns words' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /words/:id' do
    before { get "/words/#{word_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the word' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(word_id)
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:word_id) { 1_000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns Couldn\'t find Word' do
        expect(response.body).to match(/Couldn't find Word/)
      end
    end
  end

  describe 'POST /words' do
    let(:valid_attributes) { { 'name' => 'NAME' }.to_json }

    context 'when the request is valid' do
      before { post '/words', params: valid_attributes, headers: headers }

      it 'creates a word' do
        expect(json['name']).to eq('NAME')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before { post '/words', params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns Validation Failed' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /words/:id' do
    let(:valid_attributes) { { name: 'NAME' }.to_json }

    context 'when the record exists' do
      before { put "/words/#{word_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /words/:word_id' do
    before { delete "/words/#{word_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
