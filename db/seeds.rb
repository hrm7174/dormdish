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
    prep_time: 10,
    cost: 10.0,
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
    dietary_tags: [],
    ingredients: "Chicken, Veggies, Soy Sauce",
    instructions: "Cook chicken and veggies on hot plate, mix with sauce."
  },
    {
    name: "Microwave Scrambled Eggs",
    meal_type: "breakfast",
    prep_time: 4,
    cost: 1.5,
    appliances_needed: [ "Microwave" ],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Eggs, Salt, Pepper, Milk",
    instructions: "Whisk eggs with milk, microwave 30 seconds at a time, stirring until fluffy."
  },
  {
    name: "No-Cook Tuna Salad Wrap",
    meal_type: "lunch",
    prep_time: 7,
    cost: 3.0,
    appliances_needed: [],
    dietary_tags: [],
    ingredients: "Tortilla, Canned Tuna, Mayo, Lettuce, Salt",
    instructions: "Mix tuna and mayo, season, spread onto tortilla, add lettuce, wrap tightly."
  },
  {
    name: "One-Pot Lentil Curry",
    meal_type: "dinner",
    prep_time: 25,
    cost: 4.5,
    appliances_needed: [ "Hot Plate" ],
    dietary_tags: [ "Vegan" ],
    ingredients: "Lentils, Coconut Milk, Curry Powder, Onions",
    instructions: "Sauté onions, add lentils and coconut milk, simmer until thick and fragrant."
  },
  {
    name: "Peanut Butter Banana Smoothie",
    meal_type: "breakfast",
    prep_time: 3,
    cost: 1.8,
    appliances_needed: [ "Blender" ],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Banana, Peanut Butter, Milk, Ice",
    instructions: "Combine all ingredients in blender and blend until smooth."
  },
  {
    name: "Stovetop Tomato Basil Pasta",
    meal_type: "dinner",
    prep_time: 18,
    cost: 5.0,
    appliances_needed: [ "Hot Plate" ],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Pasta, Cherry Tomatoes, Basil, Olive Oil, Garlic",
    instructions: "Cook pasta, sauté tomatoes and garlic, toss with basil and olive oil."
  },
  {
    name: "Microwave Veggie Quesadilla",
    meal_type: "lunch",
    prep_time: 6,
    cost: 2.2,
    appliances_needed: [ "Microwave" ],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Tortilla, Shredded Cheese, Peppers",
    instructions: "Place cheese and chopped peppers in tortilla, fold, microwave until melted."
  },
  {
    name: "Cold Chickpea Salad",
    meal_type: "lunch",
    prep_time: 10,
    cost: 2.5,
    appliances_needed: [],
    dietary_tags: [ "Vegan" ],
    ingredients: "Chickpeas, Cucumber, Lemon Juice, Olive Oil, Salt",
    instructions: "Mix chickpeas with diced cucumber, lemon juice, olive oil, and salt."
  },
  {
    name: "Sausage & Pepper Skillet",
    meal_type: "dinner",
    prep_time: 22,
    cost: 15,
    appliances_needed: [ "Hot Plate" ],
    dietary_tags: [],
    ingredients: "Sausage, Bell Peppers, Onions, Olive Oil",
    instructions: "Slice sausage and peppers, cook on skillet until browned and tender."
  },
  {
    name: "Yogurt Parfait Cup",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 10,
    appliances_needed: [],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Yogurt, Granola, Berries, Honey",
    instructions: "Layer yogurt, granola, and berries; drizzle with honey."
  },
  {
    name: "Garlic Butter Rice",
    meal_type: "lunch",
    prep_time: 15,
    cost: 20,
    appliances_needed: [ "Hot Plate" ],
    dietary_tags: [ "Vegetarian" ],
    ingredients: "Rice, Butter, Garlic, Salt, Parsley",
    instructions: "Cook rice; sauté garlic in butter; mix together and garnish with parsley."
  }

])
