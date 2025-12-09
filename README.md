# DormDish - where meal planning meets dorm life.
DormDish is a personalized meal planner application that is designed specifically for college students. It allows users to set preferences for their budget, dietary needs, and available cooking appliances (e.g., microwave-only, dorm-safe). Based on these inputs, the system recommends simple, affordable, and nutritious recipes.

#### Team Members
- Heidy Mendez (hrm2134)
- Tobechi Onwuka (tio2003)
- Joshua Brown (jdb2252)
- Daniela Velazquez (dv2487)

## Set-up Instructions 
*Make sure you have Ruby `3.4.5` installed.*
### Step 0: Correct Ruby Installation 
Install rbenv [here](https://github.com/rbenv/rbenv#installation).
```
rbenv install 3.4.5
rbenv global 3.4.5
ruby -v
```

### Step 1: Git clone the repository
```
git clone https://github.com/hrm7174/dormdish.git
```

### Step 2: Run the bundle installer and the migrations
```
cd dormdish
bundle install
rails db:reset
rails db:migrate
```
### Step 3: Run the application locally
```
rails s -b 0.0.0.0
```
## Testing Instructions 

### Step 1: Run the `rspec` tests
```
RAILS_ENV=test bundle exec rails db:prepare
bundle exec rspec --format documentation
```
or
```
COVERAGE=rspec bundle exec rspec 
```

### Step 2: Run the `cucumber` tests
```
COVERAGE=cucumber bundle exec cucumber
```
## Links
  
Website (Heroku Deployment Link):
`https://dormdish-7a7ef8ccc38d.herokuapp.com/`
 
Github Repository Link:
`https://github.com/hrm7174/dormdish`

---

## **Iteration 1: Foundation**

In Iteration 1, we established the foundational front-end structure. No buttons were functional and the interface served as a visual prototype. We added only 2 sample recipes to demonstrate the layout concept and provide a sense of what the final application would look like.

---

## **Iteration 2**

**TLDR**; Iteration 2 transformed DormDish from a static prototype into a fully functional meal planning application. We expanded our recipe database significantly, implemented user recipe creation, built a comprehensive weekly meal planner with day and meal-type organization, created a smart shopping list generator with  duplicate detection, and added profile editing and deletion capabilities. We also established robust testing with passing Cucumber user stories and comprehensive RSpec coverage. While some features like supermarket integration and AI recipe generation are still in development, Iteration 2 delivers a working application that college students can use to plan meals, manage budgets, and generate organized shopping lists.

### **Greater Recipe Database**

We have expanded the recipe collection with numerous manually-added recipes, moving from just 2 sample recipes to a test database. This expansion allows us to properly test the filtering systems we've built and new buttons we added. It's important to note that this is a temporary database as we prepare to implement automated scraping using BeautifulSoup from local supermarkets including Morton Williams and H-Mart, which will provide us with real-time and relevant ingredient availability and pricing for Columbia Students.

### **User-Generated Recipes**

One new feature is the ability for users to add their own custom recipes. Users can now input their recipe name, cost, preparation time, meal type, required appliance, and detailed instructions. These custom recipes appear alongside our seeded recipes in the "Browse Recipes" section, creating a personalized experience for each user. Currently, users must follow the prompt instructions carefully for proper formatting, and we plan to implement detailed warnings in future iterations to guide users through this process. In upcoming versions, we'll add visual distinctions between user-created and database recipes. We're also preparing to integrate AI-powered recipe generation, which will revolutionize how users discover new meals tailored to their preferences and available ingredients. (Note that the recipes displayed will depend on the preferences selected by the user)

### **Meal Planning System**

We've introduced a weekly meal planner that allows users to organize their meals strategically throughout the week. Users can plan meals by day (Monday through Sunday) and categorize them by meal time including Breakfast, Lunch, Dinner, and Snacks. Recipes can be added directly from the recipe card details, making the planning process seamless and intuitive. This system provides a clear weekly meal visualization that helps reduce the stress and cognitive load often associated with meal planning, especially for busy college students juggling classes, work, and social commitments. The user can also open the recipe cards directly from the meal plan list to start cooking right away.

### **Smart Shopping List Generator**

Our automated shopping list creation feature represents a leap forward in functionality. The system aggregates ingredients from all planned meals and includes duplicate detection that shows which recipes need the same ingredients, eliminating redundancy and confusion. In the future, the quantity of each ingredient will also be shown here. Users can remove items from their shopping list to accommodate ingredients they already have, and the user will receive an alert asking if they are sure, and the "Purchase" button currently links to the nearest H-Mart location near Columbia as a placeholder feature. On top of this, the user can filter through the ingredients and view only the ones for a specific recipe. In future iterations, we'll enable direct ingredient browsing on the DormDish website complete with pricing information, price comparison and sorting features, and a purchase tracking system that allows users to mark items as successfully purchased.

### **Profile Management**

We've expanded user control with new profile management capabilities. Users can now edit their profile information after initial setup, allowing them to update preferences, dietary restrictions, or budget constraints as their needs change. We've also added a profile deletion option that provides a complete account reset. To ensure users make informed decisions, we've implemented a warning system that clearly displays what data will be lost including stats, saved recipes, meal plans, and preferences before they confirm deletion.

**User Stories & RSpec**

We've created well-thought-out user stories that accurately reflect how students will interact with DormDish in real-world scenarios. These user stories cover the complete user journey from initial profile creation through recipe discovery, meal planning, and shopping list generation. Our Cucumber tests demonstrate good coverage across all major features and pass successfully, validating that our implementation aligns with intended user behaviors and expectations.

In addition to behavior-driven testing, we've implemented comprehensive RSpec testing with good coverage across our codebase. Our unit tests are well-thought-out and examine both typical use cases and edge cases, ensuring that features work reliably under various conditions. All tests pass successfully, giving us confidence in the stability and reliability of our application as we continue development. This testing foundation will be crucial as we integrate more complex features like AI recipe generation and real-time supermarket data scraping in future iterations.

---

## **Known Limitations**

We want to be transparent about current limitations that we're actively addressing. Custom recipes don't yet appear when filters are applied in the Browse Recipes section, though we're aware of this issue and working on a solution. Additionally, our current database lacks ingredient pricing information, which we're adding in the near future as we integrate with local supermarkets. The shopping list purchase feature is currently a placeholder pending full supermarket integration with real-time inventory and pricing data.

---

## **Future Roadmap**

Our vision for DormDish includes deep integration with Columbia-specific resources. We're working on incorporating data from nearby supermarkets including Morton Williams and H-Mart to provide real-time ingredient availability and pricing from local stores. This will ensure that students can access ingredients conveniently without traveling far from campus.

The centerpiece of our future development is AI-powered recipe generation. Our AI agent will create personalized recipes based on available ingredients at nearby stores, user dietary preferences and restrictions, budget constraints, and available cooking appliances. The system will provide smart suggestions for multi-recipe ingredient optimization, helping students maximize their grocery budget by identifying ingredients that can be used across multiple dishes. While this work is not showcased in this submission, we are progressing towards it locally.

We're also planning enhanced user experience features including ingredient cost tracking across multiple recipes, weekly meal planning with automated budget optimization, and identification of "value ingredients" that work efficiently across multiple dishes. These features will help students not only eat better but also develop practical life skills around budgeting and meal planning that will serve them well beyond their college years.

---

## **Summary of Progress**

Iteration 1 provided us with a static front-end prototype featuring 2 sample recipes and non-functional buttons that simply demonstrated what the application could become. Iteration 2 represents a complete transformation into a functional application with an expanded recipe database, user recipe creation capabilities, a weekly meal planning system, smart shopping list generation, profile editing and deletion features, and the foundation for AI integration and supermarket scraping.

The evolution from Iteration 1 to Iteration 2 demonstrates our commitment to building a genuinely useful tool for college students. We've moved from static mockups to functional features that address real pain points in student life: limited budgets, dietary restrictions, minimal cooking equipment, and the challenge of eating nutritiously while managing a demanding academic schedule. Every feature we've implemented brings us closer to our vision of making healthy, affordable eating accessible and stress-free for Columbia students.

#### Extra Notes
This github repository holds the final project details dedicated to the course [COMS-W4152: Engineer as a Service](https://www.cs.columbia.edu/~junfeng/25fa-w4152/index.html) for Fall 2025. 