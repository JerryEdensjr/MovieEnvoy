# MovieEnvoy

### Description
The app will be called MovieEnvoy and will show information about moives.  The app will show movies that are now playing, popular, Top Rated, and Upcoming.

This iOS app is being written for Couture Lane as part of their interview process. The purpose of this exercise is to show my programming skills, prior to video call portion of the interview with Couture Lane.  

### iOS Target
The requirement is to target 11.0.  Apple recommends targeting the last version of the previous iOS version.  So, we should target 11.4 so that we get all the bug fixes from the prevous iOS release.

### Time Limit
Time: 24 hrs. - Started 11:55 pm PT

### Todo's if there is time
1.  Put API key into xcconfig


### Build an app with these requirements: 
1.  List movie categories as a UITabBar, with the following categories:
    * Now Playing
    * Popular
    * Top Rated
    * Upcoming
1.  Display results for each list in a UITableView
1.  In each table cell:
	*  display the title
	*  overview
	*  posterPath of the movie
1.  Load the posterPath image asynchronously
1.  Language: Swift
1.  Minimum supported iOS version: 11.0
1.  Orientation support: Portrait and Landscape
1.  Device support: iPhone and iPad
1.  Manage dependencies with CocoaPods
1.  Use Codable protocol: http://swiftjson.guide

#### Notes
-  Use The Movie Database API to create an app. 
	- Register for an account and get a unique API key that you simply pass along as a parameter to each of your requests. 

#### Instructions upon completion
Send link to a GitHub repo with the project. Please also note that we'd like to see your commit history in the repo as well. 

### keys / tokens

#### themoviedb.org

#### Useful Links

*  https://www.themoviedb.org/settings/api
*  https://www.themoviedb.org/talk/5beca3090e0a2632810057c3?page=1#5beca3090e0a2632810057c5
*  Documentation: https://www.themoviedb.org/documentation/api
*  Support forum: https://www.themoviedb.org/talk/category/5047958519c29526b50017d6
* Wrappers & libraries: https://www.themoviedb.org/documentation/api/wrappers-libraries

**API Key (v3 auth)**

68b13770194a73ff218ee6fae1f2c488

**API Read Access Token (v4 auth)**

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OGIxMzc3MDE5NGE3M2ZmMjE4ZWU2ZmFlMWYyYzQ4OCIsInN1YiI6IjViZWM3ODIyMGUwYTI2MzI5YzAwMTZkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8QIAzQl9W5ptVNXhGsPUM6IAGwb-WIcCy4DeK7BlTCI

**Example API Request**

https://api.themoviedb.org/3/movie/550?api_key=68b13770194a73ff218ee6fae1f2c488

