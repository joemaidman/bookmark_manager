# Bookmarkie
A web application build on the Sinatra framework that stores and recalls website URLs. Users are able to register with a unique email address and once signed-in, can save bookmarks with tags which can be shown or searched. A demo of the application can be found on Heroku at https://bookmarkie-manager.herokuapp.com/

## User Stories

```sh
As a web user,
So I can keep track of my browsing,
I want to see a list of links I’ve saved.

As a web user,
So I can expand my bookmarks
I want to add new links.

As a web user,
So I can organise my bookmarks
I want to tag my links.

As a web user,
So I can concentrate on a category
I want to filter links by tags.
```

## Technologies used
**Backend**
- Ruby
- Sinatra

**Database**
- Postgresql
- Datamapper (ORM)
- BCrypt (Password encryption)

**Testing**
- RSpec
- Capybara

**Frontend**
- Bootstrap 
- CSS

**Deployment**
- Heroku

## Installation
- Clone the repo
- `cd` to the project folder
- Run `bundle install`
- Create two local postrgresql databases called `bookmark_manager_development` and `bookmark_manager_test`

To test:
- Run `rspec`

To run the application on localhost:
- Run `rackup`
- Visit http://localhost:9292/

## Screenshots
**Sign up**

![home](https://github.com/joemaidman/bookmark_manager/blob/master/screenshots/signup.png)

**Add bookmark**

![Profile](https://github.com/joemaidman/bookmark_manager/blob/master/screenshots/add.png)

**Search Bookmarks**
![peep](https://github.com/joemaidman/bookmark_manager/blob/master/screenshots/search.png)

**List of Bookmarks**

![reply](https://github.com/joemaidman/bookmark_manager/blob/master/screenshots/list.png)
