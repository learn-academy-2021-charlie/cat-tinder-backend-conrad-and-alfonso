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
  }
]

rocks.each do |attributes|
    Rock.create attributes
    puts "creating rock #{attributes}"
end