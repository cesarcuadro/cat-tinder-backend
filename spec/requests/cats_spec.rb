require 'rails_helper'

RSpec.describe Cat, type: :request do
describe "GET /index" do
  it "get a list of all cats" do
  Cat.create(  
      name: "Bobby",
      age: 2,
      enjoys: 'Walks in the park',
      image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')

      get '/cats'
      cat = JSON.parse response.body
      expect(response).to have_http_status(200)
      expect(cat.length).to eq(1)
    end
  end

  describe "POST /create" do
    it "creates a cat and receives the proper response" do
      cat_params = {
        cat: {
        name: "Bobby",
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }}
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.last
      expect(cat.name).to eq("Bobby")
    end
  end

  describe "PATCH /update" do
    it 'updates info for cat' do
      Cat.create(  
      name: "Bobby",
      age: 2,
      enjoys: 'Walks in the park',
      image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')

      cat_params = {
        cat: {
        name: "Bobby",
        age: 2,
        enjoys: 'Knocking things off the tables',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }}
      cat = Cat.last 
      patch "/cats/#{cat.id}", params: cat_params
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.enjoys).to eq('Knocking things off the tables')
    end
  end

  describe "DELETE /destroy" do
    it "deletes a cat profile" do
      Cat.create(  
      name: "Bobby",
      age: 2,
      enjoys: 'Walks in the park',
      image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')

      cat = Cat.last 
      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(200)
      expect(Cat.all).to be_empty
  end
end

end