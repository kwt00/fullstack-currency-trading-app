# Fullstack Currency Trading App

In this project, I developed a multiplatform mobile/desktop/web app with the Google Flutter Framework to communicate with a PostgreSQL database holding transaction history and user data. There is a video example with some screenshots of the app down below. I began the project using NoSQL, but decided getting in some practice with PostgreSQL would help me learn more.

This project was created using a slightly older version of Flutter, so it might have some trouble running on newer setups.

Technologies used:
__________________
 - PostgreSQL -- Data storage system
 
 - TypeORM -- ORM to interact with PostgreSQL
 
 - JWT(JSON Web Token) -- User authentication token
 
 - REST API + HTTP Library -- Sending data to and from the database across a network
 
 - Express Library -- Bacakend server hosting
 
 - Flutter -- Application framework using the Dart language
 
 - GetIt + Provider -- Content fetching systems inside of Flutter
 
 - FlutterFlow -- UI designer
  


The app has the following features:
___________________________________
- Login/Signup page and data storing system
  - Custom and secure SHA-256 password hashing
  
- Transaction handling program + Transaction History storage
  - Stored locally in cache and on the server
  
- Option to delete transaction history for a single user, but retain that data for another

- Unique data handling/loading system with null failsafes in case of missing data

- Smooth user interface and graphics


https://user-images.githubusercontent.com/116334641/209772967-7252338d-9b46-47a0-be0f-a0dca452da3a.mp4

<img src="https://user-images.githubusercontent.com/116334641/209772877-60d481aa-54df-4328-90f8-bd29343b87b3.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="300" align= "center"/>

<img src="https://user-images.githubusercontent.com/116334641/209772899-12403138-9dfc-4f1e-b3a3-5c6a994888b1.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="300" align= "center"/>

<img src="https://user-images.githubusercontent.com/116334641/209772908-6f22c171-f40b-4d4e-a742-31c917dcc111.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="300" align= "center"/>

As always, let me know if you have any questions or comments on the work and feel free to use the code wherever you like!
