# ParkShare

## Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
ParkShare allows you to find others' spare parking spots to rent out for short-term or long-term periods. Search for a spot on a map and filter based on price, garage vs. street parking, and more. Owners can use the app to post their empty spots and start making money!

## Project Presentation

Click the thumbnail below for a recording of our in-person app walkthrough!

[![Walkthrough Video](https://img.youtube.com/vi/jRwoxPmXOk4/1.jpg)](https://youtu.be/jRwoxPmXOk4)

## App Story
- **Category:** Marketplace
- **Mobile:** ParkShare uses the device camera and maps features to enchance the experience beyond what a website can provide.
- **Story:** Allows parking spot owners who otherwise would not use their spots (particularly those who have one included with their apartment lease) to make extra money, and those who need a spot to get one cheaper than many parking lots available.
- **Market:** Individuals in cities with significant parking needs, such as Austin, may find use in the app.
- **Habit:** Users would download the app to find or rent out a spot, but would likely not check the app continually once the spot is rented out.
- **Scope:** The required user stories below are comprehensive enough to be useful, but technically feasible for this project timeline.

## Product Spec

### 1. User Stories

**Completed Stories**

As a ParkShare user I want to...
* Be greeted with an app description on the first load
* Create an account or login. The same User account serves for listing spots and renting them

As a parking spot renter I want to...
* Browse the area for available parking spots on a map, filtering by dates available, distance, and price
* See listings with pictures, descriptions, and pricing. Filter by price
* See a detailed view of the listing
* Contact the spot owner with questions, using mobile number or email

As a parking spot owner I want to...
* List my parking spot with pictures and a location
* Edit listings retroactively
* See parking spots being rented out, and change details related to those listings

**Future Stories**

* Book a spot for a particular set of dates
* Allow for purchasing of the spot within the app
* Pick specific dates the spot is open for
* Filter by dates available, distance

### 2. Screen Archetypes

* Introduction Screen
    * Greet user with app description on first load
* Login/Create Account Screen
    * Create an account or login. The same User account serves for listing spots and renting them

![Intro/Create Account](http://g.recordit.co/4jX20cXC9f.gif)


* Stream Screen
    * See listings with pictures, descriptions, and pricing. Filter by dates available, distance, and price

![Stream Screen](http://g.recordit.co/Yv6wjjhPH5.gif)

* Map View Screen
    * Browse the area for available parking spots on a map, filtering by dates available, distance, and price


* Creation Screen
    * List my parking spot with pictures and a location
    * Pick specific dates the spot is open for
    * Edit listings retroactively

![Creation Screen](http://g.recordit.co/odlSMKk1Ur.gif)

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
