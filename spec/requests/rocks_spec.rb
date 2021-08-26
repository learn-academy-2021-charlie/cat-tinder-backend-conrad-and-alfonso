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
end
