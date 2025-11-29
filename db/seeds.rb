UserProfile.destroy_all
Recipe.destroy_all

Recipe.create!([
  {
    name: "French Toast in a Mug",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 15.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Bread, Egg, Milk, Cinnamon, Sugar, Maple Syrup",
    instructions: "Tear 1 slice of bread into small pieces and place in a mug. Whisk 1 egg with 3 tablespoons milk, 1/4 teaspoon cinnamon, and 1 teaspoon sugar. Pour over bread and microwave for 1-2 minutes until set. Drizzle with 1 tablespoon maple syrup."
  },
  {
    name: "Veggie Fried Noodles",
    meal_type: "lunch",
    prep_time: 15,
    cost: 3.5,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Noodles, Mixed Vegetables, Soy Sauce, Olive Oil, Garlic",
    instructions: "Cook 100g noodles in water on the hot plate until soft. Heat 1 teaspoon olive oil, sauté 1 clove minced garlic for 30 seconds. Add 1 cup mixed vegetables and noodles. Stir in 2 tablespoons soy sauce and cook 2-3 minutes."
  },
  {
    name: "Hummus and Veggie Snack",
    meal_type: "snack",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Hummus, Carrot, Cucumber, Bell Pepper",
    instructions: "Slice 1 carrot, 1 cucumber, and 1/2 bell pepper into sticks. Serve with 1/2 cup hummus stored in the mini fridge."
  },
  {
    name: "Cheesy Broccoli Rice",
    meal_type: "dinner",
    prep_time: 12,
    cost: 3.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Rice, Broccoli, Cheese, Milk, Salt, Pepper",
    instructions: "Place 1 cup rice and 2 cups water in a microwave-safe bowl. Microwave 8 minutes until cooked. Add 1 cup broccoli florets, 1/2 cup milk, and 1/2 cup shredded cheese. Microwave 2-3 minutes until cheese melts. Season with salt and pepper."
  },
  {
    name: "Chicken Quesadilla",
    meal_type: "dinner",
    prep_time: 15,
    cost: 5.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Flour Tortillas, Chicken, Cheese, Bell Peppers, Olive Oil",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Place 1 tortilla, add 100g cooked chicken, 1/2 cup cheese, and 1/4 cup bell peppers. Top with second tortilla. Cook 2-3 minutes per side until golden and cheese melts. Cut into wedges."
  },
  {
    name: "Fruit Salad",
    meal_type: "snack",
    prep_time: 5,
    cost: 3.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Apple, Banana, Orange, Grapes, Lemon Juice, Honey",
    instructions: "Chop 1 apple, 1 banana, and 1 orange into bite-sized pieces. Add 1/2 cup grapes. Drizzle with 1 teaspoon lemon juice and 1 teaspoon honey. Chill in mini fridge before serving."
  },
  {
    name: "Veggie Chili",
    meal_type: "dinner",
    prep_time: 15,
    cost: 4.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Kidney Beans, Tomato, Onion, Bell Peppers, Chili Powder, Salt",
    instructions: "Combine 1 cup kidney beans, 1/2 cup chopped tomatoes, 1/4 cup diced onion, and 1/4 cup diced bell peppers in a microwave-safe bowl. Add 1 teaspoon chili powder and a pinch of salt. Microwave 8 minutes, stir halfway, until vegetables are tender."
  },
  {
    name: "Beef and Veggie Stir Fry",
    meal_type: "dinner",
    prep_time: 20,
    cost: 6.5,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Beef, Broccoli, Carrots, Soy Sauce, Olive Oil, Garlic",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Add 100g sliced beef, cook until browned. Add 1 cup broccoli and 1/2 cup sliced carrots. Stir in 2 tablespoons soy sauce and 1 clove minced garlic. Cook 5-7 minutes until vegetables are tender."
  },
  {
    name: "Cheese and Crackers",
    meal_type: "snack",
    prep_time: 3,
    cost: 2.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Cheese, Crackers",
    instructions: "Slice 50g of cheese and serve with 6-8 crackers chilled in mini fridge."
  },
  {
    name: "Chicken and Rice Soup",
    meal_type: "lunch",
    prep_time: 12,
    cost: 4.5,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Gluten-Free"],
    ingredients: "Chicken, Rice, Carrots, Celery, Chicken Broth, Salt, Pepper",
    instructions: "In a microwave-safe bowl, combine 100g diced chicken, 1/2 cup rice, 1/4 cup diced carrots, 1/4 cup diced celery, and 2 cups chicken broth. Microwave on high 8-10 minutes until chicken is cooked and rice tender. Season with salt and pepper."
  },
  {
    name: "Veggie Tacos",
    meal_type: "lunch",
    prep_time: 15,
    cost: 4.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Taco Shells, Bell Peppers, Onion, Corn, Cheese, Salsa",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Sauté 1/2 cup diced bell peppers, 1/4 cup onion, and 1/4 cup corn for 5 minutes. Fill 3 taco shells with veggies, sprinkle 1/2 cup cheese, and top with 2 tablespoons salsa."
  },
  {
    name: "Yogurt and Berry Snack",
    meal_type: "snack",
    prep_time: 5,
    cost: 2.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Greek Yogurt, Mixed Berries, Honey",
    instructions: "In a bowl, add 1/2 cup Greek yogurt and 1/2 cup mixed berries. Drizzle with 1 teaspoon honey. Chill in mini fridge before serving."
  },
  {
    name: "Egg and Spinach Breakfast Bowl",
    meal_type: "breakfast",
    prep_time: 6,
    cost: 2.5,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Eggs, Spinach, Milk, Cheese, Salt, Pepper",
    instructions: "In a microwave-safe bowl, whisk 2 eggs with 2 tablespoons milk. Stir in 1/2 cup spinach and 1/4 cup shredded cheese. Microwave 2 minutes, stir, then microwave another 1-2 minutes until eggs are set. Season with salt and pepper."
  },
  {
    name: "Lemon Garlic Shrimp",
    meal_type: "dinner",
    prep_time: 12,
    cost: 6.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Pescatarian", "Gluten-Free"],
    ingredients: "Shrimp, Garlic, Lemon, Olive Oil, Salt, Pepper",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Add 100g shrimp and 1 clove minced garlic. Sauté for 3-4 minutes until shrimp turn pink. Squeeze 1 teaspoon lemon juice and season with salt and pepper."
  },
  {
    name: "Veggie Wrap",
    meal_type: "lunch",
    prep_time: 5,
    cost: 3.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Tortilla, Lettuce, Tomato, Cucumber, Cheese, Hummus",
    instructions: "Spread 2 tablespoons hummus over 1 tortilla. Layer 1/4 cup lettuce, 1/4 cup sliced tomato, 1/4 cup cucumber slices, and 1/4 cup shredded cheese. Roll tightly and chill in mini fridge."
  },
  {
    name: "Sweet Potato",
    meal_type: "dinner",
    prep_time: 10,
    cost: 2.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Sweet Potato, Olive Oil, Salt, Pepper",
    instructions: "Pierce 1 medium sweet potato with fork. Microwave on high for 8-10 minutes until soft. Slice open, drizzle 1 teaspoon olive oil, and season with salt and pepper."
  },
  {
    name: "Turkey and Veggie Skillet",
    meal_type: "dinner",
    prep_time: 18,
    cost: 6.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Ground Turkey, Bell Peppers, Onion, Olive Oil, Soy Sauce, Garlic",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Add 100g ground turkey and cook until browned. Add 1/2 cup diced bell peppers, 1/4 cup onion, and 1 clove minced garlic. Stir in 1 tablespoon soy sauce and cook 5 minutes until veggies are tender."
  },
  {
    name: "Overnight Chia Pudding",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Chia Seeds, Almond Milk, Maple Syrup, Vanilla Extract, Berries",
    instructions: "Combine 3 tablespoons chia seeds with 1/2 cup almond milk, 1 teaspoon maple syrup, and 1/4 teaspoon vanilla extract in a jar. Stir and refrigerate overnight. Top with 1/4 cup berries before serving."
  },
  {
    name: "Veggie Lasagna",
    meal_type: "dinner",
    prep_time: 20,
    cost: 5.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Lasagna Noodles, Tomato Sauce, Spinach, Cheese, Garlic, Onion, Olive Oil",
    instructions: "In a microwave-safe dish, layer 2 lasagna noodles, 1/4 cup tomato sauce, 1/2 cup spinach, 1/4 cup shredded cheese, 1 teaspoon sautéed garlic and onion in olive oil. Repeat layers once. Microwave for 10 minutes until cheese melts and noodles are tender."
  },
  {
    name: "Veggie Burger",
    meal_type: "lunch",
    prep_time: 15,
    cost: 4.5,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Veggie Patty, Burger Bun, Lettuce, Tomato, Cheese, Olive Oil",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Cook 1 veggie patty for 3-4 minutes per side. Place on bun with 1 leaf lettuce, 2 tomato slices, and 1 slice cheese. Serve hot."
  },
  {
    name: "Avocado Toast",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan"],
    ingredients: "Bread, Avocado, Lemon Juice, Salt, Pepper",
    instructions: "Toast 1 slice of bread. Mash 1/2 avocado with 1 teaspoon lemon juice, spread on toast, and season with salt and pepper. Chill briefly in mini fridge if desired."
  },
  {
    name: "Spinach and Cheese Stuffed Mushrooms",
    meal_type: "snack",
    prep_time: 10,
    cost: 3.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Mushrooms, Spinach, Cheese, Garlic, Olive Oil, Salt, Pepper",
    instructions: "Remove stems from 4 large mushrooms. Sauté 1/4 cup chopped spinach with 1 clove garlic and 1 teaspoon olive oil. Stuff mushrooms with spinach mixture, top with 1/4 cup shredded cheese. Microwave 3-4 minutes until cheese melts."
  },
  {
    name: "Chicken Fajitas",
    meal_type: "dinner",
    prep_time: 20,
    cost: 6.5,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Chicken, Bell Peppers, Onion, Olive Oil, Tortillas, Spices",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Cook 100g sliced chicken with 1/4 teaspoon paprika and salt until browned. Add 1/2 cup sliced bell peppers and 1/4 cup onion, cook 5-7 minutes. Serve in 2 tortillas."
  },
  {
    name: "Cottage Cheese and Fruit",
    meal_type: "snack",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Cottage Cheese, Pineapple, Berries",
    instructions: "Scoop 1/2 cup cottage cheese into a bowl. Top with 1/4 cup pineapple chunks and 1/4 cup berries. Chill in mini fridge until serving."
  },
  {
    name: "BBQ Chicken Sweet Potato",
    meal_type: "dinner",
    prep_time: 12,
    cost: 5.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Gluten-Free"],
    ingredients: "Sweet Potato, Chicken, BBQ Sauce",
    instructions: "Pierce 1 medium sweet potato and microwave 8-10 minutes until soft. Top with 100g cooked shredded chicken and 2 tablespoons BBQ sauce. Microwave 1 more minute to warm chicken."
  },
  {
    name: "Banana Oat Mug",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 2.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Oats, Banana, Milk, Cinnamon, Honey",
    instructions: "Mash 1 ripe banana in a microwave-safe mug. Add 1/2 cup oats, 1/2 cup milk, 1/4 teaspoon cinnamon, and 1 teaspoon honey. Stir until smooth. Microwave on high for 1-2 minutes until oats are cooked. Stir and serve warm."
  },
  {
    name: "Tofu Stir Fry",
    meal_type: "dinner",
    prep_time: 15,
    cost: 4.5,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Tofu, Broccoli, Bell Peppers, Soy Sauce, Olive Oil, Garlic",
    instructions: "Cut 150g tofu into cubes. Heat 1 teaspoon olive oil on hot plate, add 1 clove minced garlic and sauté 30 seconds. Add tofu and cook 3-4 minutes until lightly browned. Add 1 cup broccoli and 1/2 cup sliced bell peppers. Stir in 2 tablespoons soy sauce and cook 5 minutes until vegetables are tender."
  },
  {
    name: "Cucumber Sandwich",
    meal_type: "snack",
    prep_time: 5,
    cost: 2.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Bread, Cucumber, Cream Cheese, Lettuce",
    instructions: "Spread 2 tablespoons cream cheese on 2 slices of bread. Add 1/4 cup thinly sliced cucumber and 1 leaf of lettuce. Close sandwich, cut in half, and chill in mini fridge until ready to eat."
  },
  {
    name: "Chicken and Broccoli Bowl",
    meal_type: "lunch",
    prep_time: 12,
    cost: 5.5,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Gluten-Free"],
    ingredients: "Chicken, Broccoli, Rice, Soy Sauce, Olive Oil, Garlic",
    instructions: "Cook 1/2 cup rice with 1 cup water in a microwave-safe bowl for 8 minutes. In a separate bowl, mix 100g diced chicken with 1/2 cup broccoli, 1 teaspoon olive oil, and 1 clove minced garlic. Microwave for 4-5 minutes until chicken is cooked. Combine with rice and add 1 tablespoon soy sauce."
  },
  {
    name: "Veggie Omelette Wrap",
    meal_type: "breakfast",
    prep_time: 12,
    cost: 3.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Eggs, Bell Peppers, Spinach, Cheese, Tortilla, Olive Oil",
    instructions: "Whisk 2 eggs and set aside. Heat 1 teaspoon olive oil on hot plate, sauté 1/4 cup diced bell peppers and 1/4 cup spinach for 2 minutes. Pour in eggs and cook until set. Sprinkle 1/4 cup cheese on top, fold omelette and place inside a tortilla. Serve warm."
  },
  {
    name: "Greek Chickpea Salad",
    meal_type: "lunch",
    prep_time: 10,
    cost: 3.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Chickpeas, Tomato, Cucumber, Red Onion, Olive Oil, Lemon Juice",
    instructions: "In a bowl, combine 1 cup chickpeas, 1/2 cup chopped tomato, 1/2 cup chopped cucumber, and 1/4 cup diced red onion. Drizzle with 1 tablespoon olive oil and 1 teaspoon lemon juice. Mix and chill in mini fridge for 5 minutes before serving."
  },
  {
    name: "Cheesy Spinach Pasta",
    meal_type: "dinner",
    prep_time: 12,
    cost: 4.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Pasta, Spinach, Cheese, Milk, Salt, Pepper",
    instructions: "Cook 1 cup pasta in 1 cup water in a microwave-safe bowl for 5-6 minutes. Drain if necessary. Add 1 cup spinach, 1/2 cup shredded cheese, and 1/4 cup milk. Microwave 2-3 minutes until cheese melts. Season with salt and pepper."
  },
  {
    name: "Salmon and Veggie Skillet",
    meal_type: "dinner",
    prep_time: 15,
    cost: 7.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Pescatarian", "Gluten-Free"],
    ingredients: "Salmon, Zucchini, Bell Peppers, Olive Oil, Garlic, Lemon",
    instructions: "Heat 1 teaspoon olive oil on hot plate. Cook 150g salmon fillet 4-5 minutes per side until done. Remove salmon, add 1/2 cup sliced zucchini and 1/2 cup bell peppers with 1 clove minced garlic. Sauté 5 minutes. Serve salmon on top of veggies and squeeze 1 teaspoon lemon juice."
  },
  {
    name: "Caprese Skewers",
    meal_type: "snack",
    prep_time: 5,
    cost: 3.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Cherry Tomatoes, Mozzarella, Basil, Olive Oil, Balsamic Vinegar",
    instructions: "Thread 4 cherry tomatoes, 4 small mozzarella balls, and 4 basil leaves onto skewers. Drizzle with 1 teaspoon olive oil and 1 teaspoon balsamic vinegar. Chill in mini fridge until serving."
  },
  {
    name: "Beef and Veggie Bowl",
    meal_type: "lunch",
    prep_time: 15,
    cost: 6.0,
    appliances_needed: ["Microwave"],
    dietary_tags: [],
    ingredients: "Beef, Broccoli, Carrots, Rice, Soy Sauce, Olive Oil",
    instructions: "Cook 1/2 cup rice with 1 cup water in microwave 8 minutes. In another bowl, mix 100g sliced beef, 1/2 cup broccoli, 1/4 cup carrots, 1 teaspoon olive oil, and 1 tablespoon soy sauce. Microwave 5-6 minutes until beef is cooked. Combine with rice and serve."
  },
  {
    name: "Veggie Pancakes",
    meal_type: "breakfast",
    prep_time: 15,
    cost: 3.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Flour, Egg, Milk, Zucchini, Carrot, Olive Oil, Salt",
    instructions: "Grate 1/4 cup zucchini and 1/4 cup carrot. Mix with 1/2 cup flour, 1 egg, 1/4 cup milk, and a pinch of salt. Heat 1 teaspoon olive oil on hot plate. Pour batter to make 2 small pancakes, cook 2-3 minutes per side until golden."
  },
  {
    name: "Protein Yogurt Parfait",
    meal_type: "snack",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Greek Yogurt, Protein Powder, Berries, Honey, Granola",
    instructions: "In a bowl, mix 1/2 cup Greek yogurt with 1 scoop protein powder. Layer with 1/4 cup berries and 1 tablespoon granola. Drizzle 1 teaspoon honey on top. Chill in mini fridge until serving."
  },
  {
    name: "Veggie Pizza Mug",
    meal_type: "snack",
    prep_time: 8,
    cost: 2.5,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Bread, Tomato Sauce, Cheese, Bell Peppers, Onion, Oregano",
    instructions: "Tear 1 slice of bread into pieces and place in a mug. Top with 2 tablespoons tomato sauce, 1/4 cup shredded cheese, 1/8 cup diced bell peppers, 1 tablespoon diced onion, and a pinch of oregano. Microwave 1-2 minutes until cheese melts."
  },
  {
    name: "Garlic Butter Shrimp",
    meal_type: "dinner",
    prep_time: 10,
    cost: 6.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Pescatarian", "Gluten-Free"],
    ingredients: "Shrimp, Butter, Garlic, Lemon, Parsley, Salt, Pepper",
    instructions: "Melt 1 teaspoon butter on hot plate. Add 100g shrimp and 1 clove minced garlic. Cook 3-4 minutes until shrimp turn pink. Squeeze 1 teaspoon lemon juice and garnish with chopped parsley. Season with salt and pepper."
  },
  {
    name: "Veggie Hummus Wrap",
    meal_type: "lunch",
    prep_time: 5,
    cost: 3.0,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan"],
    ingredients: "Tortilla, Hummus, Lettuce, Tomato, Cucumber, Carrot",
    instructions: "Spread 2 tablespoons hummus over 1 tortilla. Layer 1/4 cup lettuce, 1/4 cup sliced tomato, 1/4 cup cucumber slices, and 1/4 cup shredded carrot. Roll tightly and chill in mini fridge."
  },
  {
    name: "Egg and Cheese Breakfast Sandwich",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Bread, Egg, Cheese, Butter, Salt, Pepper",
    instructions: "Butter 1 slice of bread. In a microwave-safe bowl, whisk 1 egg with a pinch of salt and pepper. Microwave 1 minute until cooked. Place egg and 1 slice cheese between 2 slices of bread. Microwave another 20 seconds to melt cheese."
  },
  {
    name: "Veggie Stir Fry with Noodles",
    meal_type: "dinner",
    prep_time: 15,
    cost: 4.0,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegan"],
    ingredients: "Noodles, Broccoli, Bell Peppers, Carrots, Soy Sauce, Olive Oil, Garlic",
    instructions: "Cook 100g noodles in boiling water on hot plate. Heat 1 teaspoon olive oil, sauté 1 clove minced garlic for 30 seconds. Add 1 cup broccoli, 1/2 cup bell peppers, 1/4 cup carrots. Stir-fry 5 minutes. Add cooked noodles and 2 tablespoons soy sauce. Mix well and serve."
  },
  {
    name: "Berry Smoothie",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 2.5,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegan", "Gluten-Free"],
    ingredients: "Mixed Berries, Banana, Almond Milk, Honey",
    instructions: "In a blender, combine 1/2 cup mixed berries, 1 banana, 1/2 cup almond milk, and 1 teaspoon honey. Blend until smooth. Chill in mini fridge for 5 minutes if desired before serving."
  },
  {
    name: "Veggie Frittata",
    meal_type: "breakfast",
    prep_time: 10,
    cost: 3.0,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian", "Gluten-Free"],
    ingredients: "Eggs, Spinach, Bell Peppers, Cheese, Milk, Salt, Pepper",
    instructions: "Whisk 2 eggs with 2 tablespoons milk, a pinch of salt and pepper. Stir in 1/2 cup spinach, 1/4 cup diced bell peppers, and 1/4 cup shredded cheese. Pour into microwave-safe dish. Microwave 3-4 minutes until eggs are fully set. Serve warm."
  },

  {
    name: "Egg & Cheese Burrito",
    meal_type: "breakfast",
    prep_time: 7,
    cost: 3.45,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Tortilla, Egg, American Slices Cheese, Salt, Pepper, Hot Sauce",
    instructions: "Beat 1 egg with salt and pepper in a microwave-safe mug. Microwave for 45 seconds, stir, then microwave another 30 seconds until fluffy. Lay a tortilla flat, place scrambled egg in center, add 1 slice of American cheese torn into pieces. Microwave 20 seconds to melt cheese. Roll tightly into a burrito and drizzle with hot sauce."
  },
  {
    name: "Instant Ramen with Egg",
    meal_type: "lunch",
    prep_time: 5,
    cost: 3.58,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Nongshim Shin Ramyun, Egg, Green Onion",
    instructions: "Bring 2 cups water to boil in a pot on hot plate. Add ramen noodles and soup packet, cook for 3 minutes stirring occasionally. Crack 1 egg directly into boiling soup and let cook 1 minute without stirring for a soft yolk. Remove from heat, garnish with chopped green onion, and serve hot in the pot or transfer to a bowl."
  },
  {
    name: "Tuna Mayo Rice Bowl",
    meal_type: "lunch",
    prep_time: 3,
    cost: 8.48,
    appliances_needed: ["Microwave"],
    dietary_tags: [],
    ingredients: "Otg Cooked Rice, Dongwon Tuna Light Standard, Kewpie Mayonnaise, Soy Sauce, Seaweed",
    instructions: "Microwave 1 pack of Otg Cooked Rice for 2 minutes until hot. Drain 1 can of tuna and mix with 2 tablespoons Kewpie mayo and a splash of soy sauce. Fluff rice in bowl, top with tuna mixture, and garnish with crumbled roasted seaweed. Mix everything together before eating."
  },
  {
    name: "Kimchi Fried Rice",
    meal_type: "dinner",
    prep_time: 10,
    cost: 13.28,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Otg Cooked Rice, Jongga Sliced Napa Cabbage Kimchi, Egg, Sesame Oil, Soy Sauce, Green Onion",
    instructions: "Heat 1 tablespoon sesame oil in a pan on hot plate over medium-high heat. Add 1 cup chopped kimchi and stir-fry for 2 minutes. Add cooked rice (1 pack microwaved) and break up clumps, stir-frying for 3-4 minutes. Push rice to sides, crack egg in center, scramble and mix into rice. Season with soy sauce and top with sliced green onion."
  },
  {
    name: "Spam Musubi",
    meal_type: "snack",
    prep_time: 8,
    cost: 10.08,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Spam, Otg Cooked Rice, Dongwon Roasted Laver, Soy Sauce, Sugar",
    instructions: "Slice Spam into 6 pieces and fry in pan on hot plate until golden on both sides, about 2 minutes per side. Mix 1 teaspoon soy sauce with 1/2 teaspoon sugar and brush on Spam. Microwave rice for 2 minutes. Shape warm rice into rectangular blocks same size as Spam. Place Spam on rice, wrap with a strip of roasted seaweed to hold together. Serve immediately."
  },
  {
    name: "Miso Soup with Tofu",
    meal_type: "lunch",
    prep_time: 8,
    cost: 7.78,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Marukome Boy Miso Paste, San Sui Soft Tofu, Dongwon Roasted Laver, Green Onion, Water",
    instructions: "Bring 2 cups water to boil in pot on hot plate. Cube half a block of soft tofu into small pieces. Reduce heat to low, add 2 tablespoons miso paste and whisk until dissolved. Add tofu cubes and simmer gently for 2 minutes without boiling. Remove from heat, garnish with torn seaweed pieces and chopped green onion. Serve in bowls immediately."
  },
  {
    name: "Gyoza Potstickers",
    meal_type: "dinner",
    prep_time: 12,
    cost: 12.19,
    appliances_needed: ["Hot Plate"],
    dietary_tags: [],
    ingredients: "Day Lee Pride Vegetable Gyoza, Sesame Oil, Soy Sauce, Rice Vinegar, Water",
    instructions: "Heat 1 tablespoon sesame oil in non-stick pan on hot plate over medium-high heat. Place frozen gyoza flat side down in pan without overlapping. Cook 2 minutes until bottoms are golden. Add 1/4 cup water, immediately cover with lid or foil and steam 5 minutes. Remove lid, let water evaporate and bottoms crisp up for 1 minute. Make dipping sauce with 2 tablespoons soy sauce and 1 teaspoon rice vinegar. Serve hot."
  },
  {
    name: "Avocado Toast",
    meal_type: "breakfast",
    prep_time: 5,
    cost: 12.78,
    appliances_needed: ["None"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Pasco Shikishima Bread, Avocado, Salt, Pepper, Red Pepper Flakes, Lime",
    instructions: "Toast 2 slices of bread until golden. Slice 1 ripe avocado in half, remove pit, and scoop flesh into a bowl. Mash with fork until spreadable but still chunky. Season with salt, black pepper, and squeeze of lime juice. Spread mashed avocado generously on toast. Sprinkle with red pepper flakes for heat. Cut each toast in half and serve immediately."
  },
  {
    name: "Cucumber Kimchi Salad",
    meal_type: "snack",
    prep_time: 5,
    cost: 5.49,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian", "Vegan"],
    ingredients: "Cucumber, Goshen Kimchi Cucumber, Sesame Oil, Sesame Seeds, Rice Vinegar",
    instructions: "Slice 1 fresh cucumber into thin rounds and place in bowl. Add 1/4 cup chopped kimchi cucumber from jar. Drizzle with 1 teaspoon sesame oil and 1 teaspoon rice vinegar. Toss well to coat. Sprinkle with 1 teaspoon roasted sesame seeds. Chill in mini fridge for 15 minutes if desired, or eat immediately for a crunchy, spicy snack."
  },
  {
    name: "Peanut Butter Banana Wrap",
    meal_type: "breakfast",
    prep_time: 3,
    cost: 15.58,
    appliances_needed: ["None"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Tortilla, Sweet Ella's Smooth Organic Peanut Butter, Organic Banana, Honey, Cinnamon",
    instructions: "Lay tortilla flat and spread 3 tablespoons peanut butter evenly across surface. Peel and place 1 whole banana in center of tortilla. Drizzle with 1 teaspoon honey and sprinkle with pinch of cinnamon. Roll tortilla tightly around banana, tucking in sides as you roll. Slice in half diagonally for easier eating. Great for on-the-go breakfast."
  },
  {
    name: "Cheese Quesadilla",
    meal_type: "lunch",
    prep_time: 6,
    cost: 6.26,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Tortilla, Mild Cheddar Cheese, Butter, Salsa",
    instructions: "Heat pan on hot plate over medium heat and melt 1/2 tablespoon butter. Place tortilla in pan, sprinkle 1/2 cup shredded cheddar on half the tortilla. Fold tortilla in half over cheese. Cook 2 minutes until bottom is golden, flip and cook another 2 minutes until cheese melts completely. Remove from heat, let cool 1 minute, then cut into triangles. Serve with salsa for dipping."
  },
  {
    name: "Korean Seaweed Rice Rolls",
    meal_type: "snack",
    prep_time: 10,
    cost: 13.28,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Otg Cooked Rice, Dongwon Roasted Laver, Sesame Oil, Salt, Cucumber, Carrot",
    instructions: "Microwave rice for 2 minutes and mix with 1 teaspoon sesame oil and pinch of salt. Let cool slightly. Julienne cucumber and carrot into thin matchsticks. Lay seaweed sheet shiny side down. Spread thin layer of rice on bottom 2/3 of sheet. Place vegetable strips in a line on rice. Roll tightly from bottom, wetting edge to seal. Slice into 6-8 pieces with sharp knife. Serve immediately."
  },
  {
    name: "Instant Udon Soup",
    meal_type: "dinner",
    prep_time: 6,
    cost: 8.29,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Wang Fresh Udon, Shirakiku Udon Soup Base, Green Onion, Dongwon Roasted Laver",
    instructions: "Bring 2 cups water to boil in pot on hot plate. Add 2 tablespoons udon soup base concentrate and stir to dissolve. Add fresh udon noodles and cook for 3 minutes, separating strands gently with chopsticks. Remove from heat. Ladle into bowl and garnish with chopped green onion and torn seaweed pieces. Slurp while hot."
  },
  {
    name: "Yogurt Parfait",
    meal_type: "breakfast",
    prep_time: 4,
    cost: 11.28,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Chobani Greek Yogurt Vanilla, Granola, Fresh Strawberries, Honey",
    instructions: "In a bowl or cup, start with 1/2 cup vanilla Greek yogurt from mini fridge as base. Add layer of 1/4 cup granola. Slice 3-4 fresh strawberries and add as next layer. Add another 1/2 cup yogurt on top. Finish with more granola and strawberry slices. Drizzle with 1 teaspoon honey. Best eaten immediately while granola is crunchy."
  },
  {
    name: "Egg Drop Soup",
    meal_type: "lunch",
    prep_time: 8,
    cost: 8.78,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Egg, Lee Kum Kee Chicken Bouillon, Cornstarch, Green Onion, Sesame Oil",
    instructions: "Bring 2 cups water to boil in pot on hot plate. Add 2 teaspoons chicken bouillon powder and stir until dissolved. Mix 1 teaspoon cornstarch with 1 tablespoon cold water, add to soup and stir for 30 seconds to thicken slightly. Beat 1 egg in bowl. Slowly drizzle beaten egg into simmering soup while stirring gently to create ribbons. Remove from heat, add drop of sesame oil and garnish with chopped green onion."
  },
  {
    name: "Simple Pasta with Tomato Sauce",
    meal_type: "dinner",
    prep_time: 15,
    cost: 16.58,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Barilla Linguine, Rao Tomato Herb Sauce, Garlic, Olive Oil, Parmesan",
    instructions: "Bring salted water to boil in pot on hot plate. Add pasta and cook 9-11 minutes until al dente, stirring occasionally. While pasta cooks, heat 1 tablespoon olive oil in separate pan, add 1 minced garlic clove and sauté 30 seconds. Add 1 cup tomato sauce and simmer 3 minutes. Drain pasta, toss with sauce. Grate fresh parmesan on top if available. Serve hot."
  },
  {
    name: "Trail Mix Snack",
    meal_type: "snack",
    prep_time: 2,
    cost: 5.79,
    appliances_needed: ["None"],
    dietary_tags: ["Vegetarian", "Vegan"],
    ingredients: "Nutty Deluxe Trail Mix, Nutty Cranberries, Nutty Almonds",
    instructions: "In a bowl, combine 1/4 cup deluxe trail mix, 2 tablespoons dried cranberries, and 2 tablespoons roasted almonds. Mix together with hands or spoon. Portion into small container or bag for portable snacking. This provides quick energy with protein, healthy fats, and natural sweetness. Store any extra in an airtight container."
  },
  {
    name: "Tuna Salad Lettuce Wraps",
    meal_type: "lunch",
    prep_time: 7,
    cost: 13.27,
    appliances_needed: ["Mini Fridge"],
    dietary_tags: [],
    ingredients: "Tuna, Kewpie Mayonnaise, Romaine Lettuce, Cucumber, Salt, Pepper",
    instructions: "Drain 1 can of tuna well and place in bowl. Add 2 tablespoons Kewpie mayo, salt, and pepper, mix thoroughly. Dice 1/4 cucumber into small pieces and fold into tuna mixture. Separate romaine lettuce leaves and wash. Scoop tuna salad into center of each lettuce leaf. Roll or fold lettuce around filling. Eat like tacos. Keep cold ingredients in mini fridge until ready to assemble."
  },
  {
    name: "Rice with Furikake",
    meal_type: "snack",
    prep_time: 3,
    cost: 13.28,
    appliances_needed: ["Microwave"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Rice, Mishima Wakame Seaweed Furikake, Sesame Seeds, Soy Sauce",
    instructions: "Microwave 1 pack of cooked rice for 2 minutes until steaming hot. Transfer to bowl and fluff with fork. Sprinkle 2 teaspoons furikake seasoning over rice and mix gently. Add 1 teaspoon sesame seeds if desired. Drizzle with a few drops of soy sauce for extra flavor. This simple rice bowl is comforting and satisfying. Eat immediately while warm."
  },
  {
    name: "Grilled Cheese Sandwich",
    meal_type: "lunch",
    prep_time: 8,
    cost: 12.77,
    appliances_needed: ["Hot Plate"],
    dietary_tags: ["Vegetarian"],
    ingredients: "Bread, Cheddar Cheese, Butter",
    instructions: "Heat pan on hot plate over medium heat. Butter one side of each bread slice generously. Place one slice butter-side down in pan. Add 2-3 slices of cheddar cheese on bread. Top with second bread slice, butter-side up. Cook 3-4 minutes until bottom is golden brown and crispy. Flip carefully and cook another 3 minutes until second side is golden and cheese is fully melted. Cut diagonally and serve hot."
  }

])