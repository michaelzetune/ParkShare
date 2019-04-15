# ParkShare

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
ParkShare allows you to find others' spare parking spots to rent out for short-term or long-term periods. Search for a spot on a map and filter based on price, garage vs. street parking, and more. Owners can use the app to post their empty spots and start making money!

### App Evaluation
- **Category:** Shopping
- **Mobile:** ParkShare uses the device camera and maps features to enchance the experience beyond what a website can provide.
- **Story:** Allows parking spot owners who otherwise would not use their spots (particularly those who have one included with their apartment lease) to make extra money, and those who need a spot to get one cheaper than many parking lots available.
- **Market:** Individuals in cities with significant parking needs, such as Austin, may find use in the app.
- **Habit:** Users would download the app to find or rent out a spot, but would likely not check the app continually once the spot is rented out.
- **Scope:** The required user stories below are comprehensive enough to be useful, but technically feasible for this project timeline.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

General:
* Greet user with app description on first load
* Create an account or login. The same User account serves for listing spots and renting them

As a parking spot renter I want to:
* Browse the area for available parking spots on a map, filtering by dates available, distance, and price
* See listings with pictures, descriptions, and pricing. Filter by dates available, distance, and price
* See more details about the listing, including available dates
* Book a spot for a particular set of dates
* Contact the spot owner with questions, using mobile number or email

As an owner of a spare parking spot I want to:
* List my parking spot with pictures and a location
* Pick specific dates the spot is open for
* Edit listings retroactively
* See parking spots being rented out, and change details related to those listings


**Optional Stories**

* Allow for purchasing of the spot within the app

### 2. Screen Archetypes

* Introduction Screen
    * Greet user with app description on first load
* Login/Create Account Screen
    * Create an account or login. The same User account serves for listing spots and renting them
* Stream Screen
    * See listings with pictures, descriptions, and pricing. Filter by dates available, distance, and price
* Map View Screen
    * Browse the area for available parking spots on a map, filtering by dates available, distance, and price
* Creation Screen
    * List my parking spot with pictures and a location
    * Pick specific dates the spot is open for
    * Edit listings retroactively
* Detail Screen
    * See more details about the listing, including available dates
    * Contact the spot owner with questions, using mobile number or email
* Profile Screen
    * See parking spots being rented out, and change details related to those listings

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Search Tab (for spot renters)
* Post Tab (for spot owners)

**Flow Navigation** (Screen to Screen)

* Introduction Screen to:
    * Login Screen
    * Create Account Screen
* Login/Create Account Screen to:
    * Listings Search Screen
* Listings Search Screen to:
    * Listing Details Screen
    * Listings Map Screen
* Listings Map Screen to:
    * Listing Details Screen
    * Listings Map Screen
* Create Listing Screen to:
    * None
* Listing Details Screen to:
    * None


## Wireframes
<img src="https://raw.githubusercontent.com/codepath-group-2/ParkShare/master/Mockups/ParkShareMockup.png" width=1200>


## Schema

### Models
![](https://i.imgur.com/vrMog3d.jpg)

### Networking
- List of network requests by screen
    - User Registration Screen
        - (CREATE/POST) Create new user: Name, Email, Password, Profile Picture
        ```swift
        let user = PFObject(className:"user")
        user["name"] = "John Doe"
        user["email"] = "john@utexas.edu"
        user["password"] = "******"
        let imageData = UIImagePNGRepresentation(image)
        let imageFile = PFFileObject(name:"image.png",data:imageData)
        user["profilePicture"] = imageFile
        user.saveInBackground {(success: Bool, error: Error?) in
        if (success) {
        // The object has been saved.
        } else {
        // There was a problem, check error.description
        }}
        ```
    - Home Feed Screen 
        - (READ/GET) get all posts
        ```swift
        let query = PFQuery(className:"post")
        query.getObjectInBackground(withId: "") { (gameScore:
        PFObject?, error: Error?) in
            if let error = error {
                //The query returned an error
                print(error.localizedDescription)
            } else {
                //The object has been retrieved
                print(gameScore)
            }
        }
        ```
        - (READ/GET) author for the posts
        
    - Map Screen
        - (READ/GET) location of posts
        ```swift
        let query = PFQuery(className:"post")
        query.whereKey("location", equalTo: )
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
                print(error.localizedDescription)
            } else if let posts = posts {
          print("Successfully retrieved \(posts.count) posts.")
          // TODO: Do something with posts...
           }
       }
       ```
        - (READ/GET) title of posts
    - New Post Screen
        - (CREATE/POST) new posts
        ```swift
        let post = PFObject(className:"post")
        post["author"] = PFUser.currentUser().name
        post["title"] = "This is a title"

        let parkingImage = UIImagePNGRepresentation(image)
        let parkingImageFile = PFFileObject(name:"image.png",data:imageData)
        post["parkingImage"] = parkingImageFile
                
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)

        post["creationDate"] = 
        //figure out how to save date and time in Parse
        
        post["description"] = "This is a description"
        
        post["location"] = [latitute, longitude]
        post["monthlyPrice"] = 1.00
        post["parkingType"] = ["Garage", "Street covered", "street uncovered"]
        
        post["availableDates"] = {JSONObject}
        //figure out how to use Swift DateInterval Class
        
        post[phoneNumber] = 000-000-000
        
        post.saveInBackground {(success: Bool, error: Error?) in
        if (success) {
        // The object has been saved.
        } else {
        // There was a problem, check error.description
        }}
        ```
