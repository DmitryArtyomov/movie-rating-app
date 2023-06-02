## Movie Rating Web Application

### Objective
Create a simple web application that allows users to browse movies, rate them, and add comments, using Ruby on Rails 7, Rails Turbo, Stimulus JavaScript, and Bootstrap 5.

### Features
1. **User Authentication**: Implement basic user registration, login, and logout functionality. You are free to use popular gems like Devise or Sorcery for this purpose, or to handroll a simple authentication system. The focus is more on functionality than on security for this exercise.
2. **Movie Database**: There should be a list of movies in the database. Each movie should at least have the following attributes: title, director, release year, and genre. For simplicity, these can be pre-filled with data. An admin interface for adding more movies is a nice-to-have but not required.
3. **Rating and Reviewing**:
	- Users should be able to rate movies on a scale of 1 to 5.
	- Users should also be able to write a brief review/comment about a movie.
	- Users should only be able to review or rate a movie once, but they can update their rating or review.
4. **Live Streaming**: Use Rails Turbo's live streaming feature to update movie ratings in real-time, reflecting changes as soon as a user submits a new rating.
5. **Stimulus JS**: Utilize Stimulus for any required interactive elements. For instance, consider using Stimulus when a user rates a movie or submits a review, showing instant feedback before the server processes the update.
6. **Views**: The application should have the following views styled using Bootstrap 5:
	- Home/Index View: Display a list of all movies. Each entry should display its title, director, release year, genre, average rating, and a link/button to its individual Movie Detail page.
	- Movie Detail View: Show all details of a movie, including all user reviews. This page should allow logged-in users to rate the movie and write/edit their review.
	- User Profile View: Show a user's details and a list of their reviews and ratings.
7. **Testing**: Write unit and/or integration tests for your models and controllers. This is to test the candidate's ability to write meaningful tests and their understanding of TDD/BDD concepts.

### Installation

1. Pull the repo
2. Run `bundle install`
3. Run `rails db:create db:migrate`
4. Populate the database with movies using `rails data:import`
