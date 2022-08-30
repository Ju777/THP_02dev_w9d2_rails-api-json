# Create a simple Rails API. No front is asked.

## The today exercice's aim is to create a simple CRUD API with Rails + devise-jwt : authentication + POST GET PUT DELETE features for an Article resource.

### How to use this repo ?
- Clone this repo in your local computer 
- Launch 'bundle install' + enter.
- Launch 'rails s' + enter, then open http://localhost:3000 with your internet browser.
- Use an app like Postman or Insomnia to make your requests, endpoints are :
    - To sign up : http://localhost:3000/users => method POST
    - To login : http://localhost:3000/users/sign_in => method POST
    - To access your user's informations : http://localhost:3000/member-data => method GET
    - To logout : http://localhost:3000/users/sign_out => method DELETE
    - TO create an article : http://localhost:3000/articles => method POST