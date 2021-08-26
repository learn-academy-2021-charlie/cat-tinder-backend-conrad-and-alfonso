require 'rails_helper'

RSpec.describe "Rocks", type: :request do
  describe "GET /index" do
    it 'gets a list of rocks' do
      Rock.create(
      name: "Obsidian",
      color: "black",
      brilliance: 3,
      hardness: 4
      )
      get '/rocks'
      rock = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(rock.length).to eq 1
    end
  end

  describe "POST /create" do
    it 'creates a rock' do
      rock_params = {
        rock: {
          name: "Obsidian",
          color: "black",
          brilliance: 3,
          hardness: 4,
        }
      }
      post '/rocks', params: rock_params
      new_rock = Rock.first
      expect(new_rock.name).to eq 'Obsidian'
      expect(new_rock.color).to eq 'black'
      expect(new_rock.brilliance).to eq 3
      expect(new_rock.hardness).to eq 4
    end
  end

  describe "PATCH /update" do
    it 'updates a rock' do
      rock_params = {
        rock: {
          name: "Obsidian",
          color: "black",
          brilliance: 3,
          hardness: 4,
        }
      }
      # post '/rocks', params: rock_params
      rock = Rock.create(rock_params[:rock])
      updated_rock_params = {
        rock: {
          name: "Obsidian",
          color: "black",
          brilliance: 9,
          hardness: 4,
        }
      }
      # rock = Rock.first
      patch "/rocks/#{rock.id}", params: updated_rock_params
      updated_rock = Rock.first
      expect(response).to have_http_status(200)
      expect(updated_rock.brilliance).to eq 9
    end
  end

  describe "DELETE /destroy" do
    it 'deletes a rock' do
      rock_params = {
        rock: {
          name: "Obsidian",
          color: "black",
          brilliance: 3,
          hardness: 4,
        }
      }
    rock = Rock.create(rock_params[:rock])
    delete "/rocks/#{rock.id}"
    expect(response).to have_http_status(200)
    expect(Rock.all.length).to eq 0
    end
  end

  describe "cannot create a rock without valid attributes" do 
  
    it 'cannot create a rock without a name' do 
      rock_params = {
        rock: {
          color: "black",
          brilliance: 3,
          hardness: 4,
        }
      }
    
      post '/rocks', params: rock_params
      rock = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(rock["name"]).to include("can't be blank")
    
    end

    it 'cannot create a rock without a color' do
      rock_params = {
        rock: {
          name: "Obsidian",
          brilliance: 3,
          hardness: 4,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(rock['color']).to include("can't be blank")
    end

    it 'cannot create a rock without a brilliance' do
      rock_params = {
        rock: {
          name: "Obsidian",
          color: "black",
          hardness: 4,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(rock['brilliance']).to include("can't be blank")
    end

    it 'cannot create a rock without a hardness' do
      rock_params = {
        rock: {
          name: "Obsidian",
          color: "black",
          brilliance: 3,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(rock['hardness']).to include("can't be blank")
    end

    it 'cannot be created with a short name' do 
      rock_params = {
        rock:{
          name: "Ore",
          color: "black",
          brilliance: 3,
          hardness: 4,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(rock["name"]).to include("is too short (minimum is 4 characters)")
    end


    it 'cannot be created with a hardness lower than 1' do 
      rock_params = {
        rock:{
          name: "Obsidian",
          color: "black",
          brilliance: 3,
          hardness: 0,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(rock["hardness"]).to include("must be greater than or equal to 1")
    end

    it 'cannot be created with a hardness higher than 10' do 
      rock_params = {
        rock:{
          name: "Obsidian",
          color: "black",
          brilliance: 3,
          hardness: 11,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(rock["hardness"]).to include("must be less than or equal to 10")
    end


    it 'cannot be created with a brilliance lower than 1' do 
      rock_params = {
        rock:{
          name: "Obsidian",
          color: "black",
          brilliance: 0,
          hardness: 3,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(rock["brilliance"]).to include("must be greater than or equal to 1")
    end

    it 'cannot be created with a brilliance higher than 10' do 
      rock_params = {
        rock:{
          name: "Obsidian",
          color: "black",
          brilliance: 11,
          hardness: 3,
        }
      }
      post '/rocks', params: rock_params 
      rock = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(rock["brilliance"]).to include("must be less than or equal to 10")
    end


  end

  describe "cannot update a rock without valid attributes" do 

    it 'cannot be updated without a valid name' do 
      rock_params = {
        rock:{
          name: "Obsidian",
          color: "black",
          brilliance: 10,
          hardness: 3,
        }
      }
      rock = Rock.create(rock_params[:rock])

      invalid_rock_params = {
        rock:{
          name: "Ore",
          color: "black",
          brilliance: 10,
          hardness: 3,
        }
      }

      patch "/rocks/#{rock.id}", params: invalid_rock_params
      rock_body = JSON.parse(response.body)
      
      expect(response).to have_http_status(422)
      expect(rock_body["name"]).to include("is too short (minimum is 4 characters)")

    
    end

  end



end
