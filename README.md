# Deposits Exercise

### Abstract:
This deposits exercise features a simple Ruby on Rails API which handles deposits being made into a tradeline. 

### Local Installation:
1. Clone down this repository to your local machine.
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run `rails s` to start up the server. 

### Contributors
[Chrissy Cooper](https://github.com/chrissycooper)

### Wins
This exercise felt like the perfect way to flex and stretch my fairly recent Rails muscles. I was happy with how easily my background in class-based javascript made conceptualizing the parent-child class relationship of the tradeline and deposits models. Thank you for taking the time to check it out!

### Challenges
I made an error in creating my deposits table, I migrated the amount attribute as a string. I did some research and learned how to drop the table and remigrate it with the proper data types. I'm glad I caught that issue early. I also chose to add `outstanding_balance` as an attribute to the tradeline model to keep the original amount and the balance distinct. I appreciated the practice that came with adding a third migration to add the column, since dropping the table and re-migrating it did not work for this change. 

### Future Features
There are a few things I would add to this exercise with more time investment. I would add versioning to the API, so that changes could more easily be applied without breaking code that hypothetically relied on the first version.
Testing is a big component I would spend more time on. This was my first time working with RSpec, and I'd love to take a few days to deep dive into testing requests. I have a few tests up and running to test a few basic happy paths and at least one sad path. I'd also like to spend more time working on integration testing, making sure everything is working together as expected. 

### Endpoints
Tradeline
<details>
  <summary>GET: All tradelines</summary>
  
  <br>
  Request:

  ```JS
  GET /tradelines
  ```

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 404 |


  ```JSON
	[
    {
        "id": 1,
        "name": "Home Loan",
        "amount": "193310.0",
        "created_at": "2024-03-24T23:48:43.259Z",
        "updated_at": "2024-03-25T23:02:53.456Z",
        "outstanding_balance": "189310.0"
    },
    {
        "id": 2,
        "name": "Car Loan",
        "amount": "36685.0",
        "created_at": "2024-03-24T23:48:43.265Z",
        "updated_at": "2024-03-25T17:45:36.166Z",
        "outstanding_balance": "36685.0"
    },
    {
        "id": 3,
        "name": "Personal Loan",
        "amount": "4786.0",
        "created_at": "2024-03-24T23:48:43.274Z",
        "updated_at": "2024-03-25T23:06:58.236Z",
        "outstanding_balance": "4786.0"
    }
]
  ```
</details>
<details>
  <summary>GET: a specific tradeline</summary>
  
  <br>
  Request:

  ```JS
  GET /tradelines/:id
  ```


  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 404 |


  ```JSON
	{
    "outstanding_balance": "189310.0",
    "id": 1,
    "name": "Home Loan",
    "amount": "193310.0",
    "created_at": "2024-03-24T23:48:43.259Z",
    "updated_at": "2024-03-25T23:02:53.456Z"
}
  ```
</details>
<details>
  <summary>POST: create a new tradeline</summary>
  
  <br>
  Request:

  ```JS
  POST /tradelines/
  ```
  <br>
   Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `name` | Required | string | name of account
  | `amount` | Required | decimal | amount 
  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 404 |


  ```JSON
	{
    "id": 6,
    "name": "new tradeline",
    "amount": "5000.0",
    "created_at": "2024-03-26T18:48:02.256Z",
    "updated_at": "2024-03-26T18:48:02.256Z",
    "outstanding_balance": null
}
  ```
</details>

<br>

Deposits
<details>
  <summary>GET: All deposits of a given tradeline</summary>
  
  <br>
  Request:

  ```JS
  GET /tradelines/:tradeline_id/deposits
  ```

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 404 |


  ```JSON
	[
    {
        "id": 1,
        "date_of_deposit": "\"06/05/24\"",
        "amount": "1000.0",
        "tradeline_id": 1,
        "created_at": "2024-03-25T17:24:32.010Z",
        "updated_at": "2024-03-25T17:24:32.010Z"
    },
    {
        "id": 2,
        "date_of_deposit": "\"06/15/24\"",
        "amount": "1000.0",
        "tradeline_id": 1,
        "created_at": "2024-03-25T17:24:41.211Z",
        "updated_at": "2024-03-25T17:24:41.211Z"
    }
]
  ```
</details>
<details>
  <summary>GET: a specific deposit of a given tradeline</summary>
  
  <br>
  Request:

  ```JS
  GET /tradelines/:tradeline_id/deposits/:id
  ```

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 404 |


  ```JSON
    {
        "id": 2,
        "date_of_deposit": "\"06/15/24\"",
        "amount": "1000.0",
        "tradeline_id": 1,
        "created_at": "2024-03-25T17:24:41.211Z",
        "updated_at": "2024-03-25T17:24:41.211Z"
    }
  ```
</details>
<details>
  <summary>POST: create a deposit of a given tradeline</summary>
  
  <br>
  Request:

  ```JS
  POST /tradelines/:tradeline_id/deposits/
  ```
  <br>

  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `date_of_deposit` | Required | string | 05/22/24
  | `amount` | Required | decimal | 05/22/24
  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Invalid Deposit` | 422 |
  | `Failure`| 404 |


  ```JSON
    {
        "id": 2,
        "date_of_deposit": "\"06/15/24\"",
        "amount": "1000.0",
        "tradeline_id": 1,
        "created_at": "2024-03-25T17:24:41.211Z",
        "updated_at": "2024-03-25T17:24:41.211Z"
    }
  ```
</details>



### Original Requirements

<details>

A tradeline on a credit report represents an account, such as a credit card or car loan.

In the codebase, the following exists:

* The `Tradeline` model, which can be used to store tradelines in the database.
* A `Tradeline` controller, which serves both the `index` and `show` routes for tradelines.
* Basic `rspec` tests on the controller with a `tradeline` FactoryBot.

Add in the ability to create deposits for a specific tradeline using a JSON API call. You should store the deposit date (this is most likely a future date), and amount. Expose the outstanding balance for a given tradeline in the JSON output for `TradelinesController#show`, and `TradelinesController#index`. The oustanding balance should be calculated as the `amount` minus all of the deposit amounts.

In addition:

* A deposit should not be able to be created that exceeds the outstanding balance of a tradeline.
* You should return validation errors if a deposit cannot be created.
* Expose endpoints for seeing all deposits for a given tradeline, as well as seeing an individual deposit.

Feel free to add any gems to the `Gemfile`, and touch any of the existing code. For example, if you prefer to use PostgreSQL or MySQL over the included SQLite, or a serializer of your choice, please go ahead. This is not required, but you can be as creative as you want.

This exercise is purely API based, and will not have any frontend components. Please do not spend more than 3 hours on this.

## Setup

The exercise requires Ruby 3.3.0. Simply clone the repo, and run `bundle` to get started. This will install Rails 7.1.2, and the other specified gems.

## Submission

Please do not fork the repo; if forked accidentally, please delete the fork. For review, either of the following methods for submission are preferred:

* Cloning the repository and then uploading it under your Github account for review.
* Zipping up the directory. 
</details>