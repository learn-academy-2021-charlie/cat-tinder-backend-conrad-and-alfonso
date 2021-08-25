rocks = [
  {
    name: "Emerald",
    color: "green",
    brilliance: 6,
    hardness: 8,
  },
  {
    name: "Diamond",
    color: "clear",
    brilliance: 7,
    hardness: 10,
  },
  {
    name: "Obsidian",
    color: "black",
    brilliance: 3,
    hardness: 4,
  },
  {

    name: "Basalt",
    color: "grey",
    brilliance: 0,
    hardness: 6,
  },
  {
    name: "Dwayne 'The Rock' Johnson",
    color: "brown",
    brilliance: 10,
    hardness: 10,
  },
  {
    name: "Serpentine",
    color: "green",
    brilliance: 2,
    hardness: 2,
  }
]

rocks.each do |attributes|
    new_rock = Rock.new attributes
    found_rock = Rock.where attributes 
        if found_rock.length > 0 
            puts "Found rock with #{attributes}. Not creating new rock."
        else
            puts "Rock not found. Creating rock #{attributes}"
            new_rock.save
        end
    # puts "creating rock #{attributes}"
end