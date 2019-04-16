## Weegle: The Backend

This Rails application is the backend for Weegle. It provides access to the necessary API endpoints and communicates with the PostgreSQL Database. It also demonstrates use of a channel to establish an action cable connection via websockets between players of the same game. <a href=https://vimeo.com/329654271>Demo Video</a>

Frontend: [Weegle Frontend Repository](https://github.com/lumrachele/final-project-front-end)

<h2>Contents</h2>

* [Essential Gems](#essential-gems)

* [Installation](#installation)

* [Models](#models)

* [Future Development](#future-development)



# <h2>Essential Gems</h2>

This app uses Ruby version 2.5.3. This Rails application was created using ```rails new final-project-back-end --api --database=postgresql```, thus allowing the app to be created as an API and directing it to use postgreSQL databases. <a href=https://cloudinary.com/users/login>Cloudinary</a> is used in ```UserGamesController#create``` to host Base64 filetypes taken with the webcam and generate a unique url such that it can be stored in the database as a url. Gems 'rack-cors' and 'active_model_serializers' are used for Cross-Origin Resource Sharing, allowing for cross-origin AJAX.

# <h2>Installation</h2>

To get started with this app, simply fork and clone this repository, as well as the [frontend repository](https://github.com/lumrachele/final-project-front-end). Remember to ```bundle install``` and run ```rails db:create && rails db:migrate && rails db:seed``` to create and initialize the database. Double check that you have PostgreSQL running on your computer. To run, enter the command ```rails s``` in your terminal and navigate to ```http://localhost:3000``` or whatever port number you would like to indicate, as long as it differs from the port of the frontend.

# <h2>Models</h2>

There are five models used for this application:

![Schema](/images/schema.png)

<h3>User</h3>
The User model is used upon username creation. There is no password or authentication necessary. The User is the main access point for all join tables.

Key Controller Methods: create.

<h3>Game</h3>
The Game model keeps track of the gameroom number (its ID), and whether the game is active. Many users can join the same game.

Key Controller Methods: create, update.

<h3>UserGame</h3>
A UserGame is the join table between Users and Games. A game can have many users. The image captured by the webcam is stored in a UserGame model under the "imageUrl" attribute.

Key Controller Methods: create, update.

<h3>Caption</h3>
The Caption model is created upon a caption submission. It is necessary for this to have its own model such that a caption can be randomly assigned to a game upon its creation. A caption belongs to a user, and has many GameCaptions.

Key Controller Methods: create.

<h3>GameCaption</h3>
A GameCaption acts as the join table between a Game and a Caption. The importance of this model lies within its Points attribute, which is updated when users vote on specific captions.

Key Controller Methods: create, update.


# <h2>Future Development</h2>

- customize serializers such that they provide only the necessary information
- create custom controller methods to do more work on the backend rather than the frontend (example: create GameCaption in the CaptionController, etc...)
- create unique channel for each game

At this moment, this application does not allow for open source contributions.
