# Eventr

A multi-page web application that presents a map of closest concerts near you. By date, one can browse through the various concerts and save the event onto their personal profile. Through each event, a user can also see other users who have saved the same event. Presenting all the information a user would need for any concert within their area.

## Overview
An application to find same day live music events nearby.

##### Designed & Developed by Team Niner (Four Points of the Compass):
* **Alexander Marino**

* **Daniel Khalili**

* **Ben Aplin**

* **Colleen McCaffrey**

##### Technologies Used:
* Ruby on Rails
* jQuery
* Foundation CSS
* PostgreSQL
* Javascript

##### API Used:
* bandsintown.com
* googleapis.com
* spotify.com



##### Trello
[Private Trello Board](https://trello.com/b/sO7tRKSY/niner-ga-project-3)

#### ERD
![ERD](./eventer_erds.png)

#### Wireframes
![wireframes](./wireframe_routes.png)

#### Routes
* GET "/" root
* POST "/users" new users
* GET "/users/:id" show user
* PUT "/users/:id" edit user
* DELETE "/users/:id" delete user
* GET "/events" events index
* GET "/events/:id" show event
* GET "/search" search index
* GET "/search/:id" show search

### User Stories
Users can login, edit profile with avatar, link to twitter account and an about me section.
Users can search events by date.
A user can save an event in their profile.
Users can delete saved events.
Users can see the profiles of other users who have also saved the same event. Banding together.
