# Full Stack Project - Yelp

## State Shape
+ `Entities`
+ `UI`
+ `Errors`


## Yelp Sample State

```js
{
  entities: {
    businesses: {
      1: {
        id: 1,
        name: "Boba Guys",
        address: "1002 16th St, San Francisco, CA 94107",
        phone: "(415) 967-2622",
        url: "bobaguys.com",
        hours: ?
        cost: "$"
      },
      2: {
        id: 2,
        name: "Mr. and Mrs. Miscellaneous",
        address: "699 22nd St, San Francisco, CA 94107",
        phone: "(415) 970-0750",
        url: ,
        hours: ?
        cost: "$"
      },
    },
    users: {
      7: {
        id: 7,
        first_name: "Adrienne",
        last_initial: "L.",
        email: "adrienne@gmail.com"
        current_city: "San Francisco"
      }
      8: {
        id: 8
        first_name: "Jerry",
        last_initial: "L.",
        email: "jerry@gmail.com"
        current_city: "San Francisco"
      },
    }
    reviews: {
      15: {
        id: 15,
        business_id: 2
        body: "Best ice cream in the city!",
        rating: 5,
        reviewer_id: 7
      }
      18: {
        id: 18,
        business_id: 1
        body: "I'm addicted to their strawberry matcha latte.",
        rating: 4,
        reviewer_id: 8  
      },
    }
  },
  ui: {
    loading: true/false
  },
  errors: {
    login: ["Incorrect email or password"],
    signup: [?]
  },
  session: {
    id: 10,
    email: "justin@gmail.com"
  }
}
```
