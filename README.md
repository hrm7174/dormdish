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
  
## Links
  
Website (Heroku Deployment Link):
`https://dormdish-7a7ef8ccc38d.herokuapp.com/`
 
Github Repository Link:
`https://github.com/hrm7174/dormdish`

#### Extra Notes
This github repository holds the final project details dedicated to the course [COMS-W4152: Engineer as a Service](https://www.cs.columbia.edu/~junfeng/25fa-w4152/index.html) for Fall 2025. 