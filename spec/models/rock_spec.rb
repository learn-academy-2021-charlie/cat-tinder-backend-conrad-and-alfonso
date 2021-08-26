require 'rails_helper'

RSpec.describe Rock, type: :model do
  it "should have a name" do
  
    rock = Rock.create(color: "red",brilliance: 1, hardness: 1)
    expect(rock.errors[:name]).to_not be_empty
  
  end

  it "should have a color" do
  
    rock = Rock.create(name: "red quartz",brilliance: 1, hardness: 1)
    expect(rock.errors[:color]).to_not be_empty
  
  end

  it "should have a brilliance" do
  
    rock = Rock.create(name: "red quartz",color: "red", hardness: 1)
    expect(rock.errors[:brilliance]).to_not be_empty
  
  end

  it "should have a hardness" do
  
    rock = Rock.create(name: "red quartz",brilliance: 1,color: "red")
    expect(rock.errors[:hardness]).to_not be_empty
  
  end


  it 'should have a name length of at least 4' do 
      rock_data = {
        name: "Ore",
        color: "black",
        brilliance: 3,
        hardness: 4,
      }
    rock = Rock.create(rock_data)
    expect(rock.errors[:name]).to_not be_empty
  
  end

  it 'should have a hardness of at least 1' do 
    rock_data = {
      name: "Obsidian",
      color: "black",
      brilliance: 3,
      hardness: 0,
    }
  rock = Rock.create(rock_data)
  expect(rock.errors[:hardness]).to_not be_empty
  
  end

  it 'should have a hardness of at most 10' do 
    rock_data = {
      name: "Obsidian",
      color: "black",
      brilliance: 3,
      hardness: 11,
    }
  rock = Rock.create(rock_data)
  expect(rock.errors[:hardness]).to_not be_empty
  
  end


  it 'should have a brilliance of at least 1' do 
    rock_data = {
      name: "Obsidian",
      color: "black",
      brilliance: 0,
      hardness: 3,
    }
  rock = Rock.create(rock_data)
  expect(rock.errors[:brilliance]).to_not be_empty
  
  end

  it 'should have a brilliance of at most 10' do 
    rock_data = {
      name: "Obsidian",
      color: "black",
      brilliance: 11,
      hardness: 3,
    }
  rock = Rock.create(rock_data)
  expect(rock.errors[:brilliance]).to_not be_empty
  
  end


end
