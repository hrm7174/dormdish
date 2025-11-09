UserProfile.destroy_all
Recipe.destroy_all

Recipe.create!([
  {
    name: "Microwave Mac & Cheese",
    meal_type: "dinner",
    prep_time: 10,
    cost: 3.5,
    appliances_needed: [ "Microwave" ],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Pasta, Cheese, Milk",
    instructions: "Mix pasta and cheese, microwave for 5 mins."
  },
  {
    name: "Overnight Oats",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 2.0,
    appliances_needed: [],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Oats, Milk, Honey, Banana",
    instructions: "Mix everything and refrigerate overnight."
  },
  {
    name: "Chicken Stir Fry",
    meal_type: "dinner",
    prep_time: 20,
    cost: 8.0,
    appliances_needed: [ "Hot Plate" ],
    dietary_tags: [ "None" ],
    ingredients: "Chicken, Veggies, Soy Sauce",
    instructions: "Cook chicken and veggies on hot plate, mix with sauce."
  }
])
