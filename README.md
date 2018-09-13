# UberEATS Reverse Engineering
This app is meant to be used as demo and show the various filters for restaurants near you. 

- :bow: any code review or suggestion are appreciated
- :fire: contribution is definitely welcomed
- :raised_hands: if you are a UI/UX designer and wants to see certain animation. Please Let me know!

The CI/CD will be implemented on Bitrise and the also the unit testing will be done on the data layer

| Stages                  | Status                          |  Hours |
| ----------------------- |:-------------------------------:| :-----:|
| Set User Location       |:ballot_box_with_check:          | 8      |
| Fetch Restaurants       |:ballot_box_with_check:          | 24     |
| Filter Restaurants      | UI done                         |        |
| Fetch Restaurant Meals  |                                 |        |
| Show Restaurant Info    | :ballot_box_with_check:         |        |
| Filter Restaurant Meals | :ballot_box_with_check:         |        |
| Order Meal              |                                 |        |
| Order Payment           |                                 |        |
| Order Tracking          |                                 |        |

## Login
```
email: sean@gmail.com
password: abcPassword
```

## Google Map Service 
- You will not be able to make any network calls without the `config.swift` file because it contains all the access keys. Please DM [@sean7218](https://twitter/sean7218) if you want to play with the location service and backend Yelp API
- The map and the location is using Google Map Service and Google Places. Please obtain your own API token. Creating a file in the same folder where `AppDelegate.swift` with following
```swift
// ubereats/config.swift
 import Foundation

 struct KEYS {
     static var GOOGLE_MAP_KEY: String = "YOUR_GOOGLE_ACCESS_KEY"
     static var ACCESS_BEAR_KEY: String = "YOUR_BACKEND_API_ACCESS_KEY"
 }
 ```

## Pod

Pods are not pushed to this remote so you have to run the following before running the app
```
pod install
```

# Home Page
![show](https://github.com/sean7218/ubereats/blob/master/UberEATS/Design/iPhone-X_MockUp.gif)

# Detail View
![detail-viewgif](https://user-images.githubusercontent.com/18454151/43378304-059d4f7e-9394-11e8-85b8-7aefb9896e65.gif)
