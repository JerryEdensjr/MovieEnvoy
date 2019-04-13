# <span style="color:#00D277"> MovieEnvoy </span>  

### <span style="color:#00D277">Description</span>  
The app will be called MovieEnvoy and will show information about moives.  The app will show movies that are now playing, popular, Top Rated, and Upcoming.

This iOS app is being written as for showing skills to potential employers and clients.    

### iOS Target  
I am targeting iOS 12.2.  *Apple recommends targeting the last version of the previous iOS version.  So, we should target 11.4 so that we get all the bug fixes from the prevous iOS release.* However, for this app it will be targeted to the lastest version of iOS.

### Language  
This app will be written using 5.0.  

### Todo
1.  Put API key into xcconfig

### Requirements
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

### keys / tokens

#### themoviedb.org

#### Useful Links

*  https://www.themoviedb.org/settings/api
*  https://www.themoviedb.org/talk/5beca3090e0a2632810057c3?page=1#5beca3090e0a2632810057c5
*  Documentation: https://www.themoviedb.org/documentation/api
*  Support forum: https://www.themoviedb.org/talk/category/5047958519c29526b50017d6
* Wrappers & libraries: https://www.themoviedb.org/documentation/api/wrappers-libraries

**Example API Request**

```https://api.themoviedb.org/3/movie/550?api_key=68b13770194a73ff218ee6fae1f2c488```  

