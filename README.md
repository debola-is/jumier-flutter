# Jumier

A fully functional clone of the Jumia NG mobile shopping application built with Flutter for the mobile client and Node.js for the backend service.

## Requirements

- [Flutter SDK and Dart](https://docs.flutter.dev/get-started/install?gclid=CjwKCAjwsfuYBhAZEiwA5a6CDKg0IENEmEpQRDwt-8cTHp6FIf8UMET-3zG9M-oiQBlKAq_imDRKgRoCnpsQAvD_BwE&gclsrc=aw.ds)
- [Android Emulator or iOS simlator](https://developer.android.com/studio?gclid=CjwKCAjwsfuYBhAZEiwA5a6CDNqyXXrWHoSk3KMamypQGg5z5MH933GAS-UYDfDMD8-OnUCSAmSHgBoC-AUQAvD_BwE&gclsrc=aw.ds#downloads)
- Physical android/iOS device can also be used in place of emulator.

## Features Implemented

- Email & Password Authentication
- Persisting Auth State
- Searching Products
- Filtering Products (Based on Category)
- Product Details
- Rating
- Getting Deal of the Day
- Cart
- Checking out with Google/Apple Pay
- Viewing My Orders
- Viewing Order Details & Status
- Sign Out
- Admin Panel (Only available to admin accounts)
    - Viewing All Products
    - Adding Products
    - Deleting Products
    - Viewing Orders
    - Changing Order Status
    - Viewing Total Earnings

| **Screen Title** | **as Seen on Jumia Original**                    | **My Implementation**                            |
|------------------|--------------------------------------------------|--------------------------------------------------|
| Home Page 1      | ![Alt text](images/home-1.jpg?raw=true "Home 1") | ![Alt text](images/home-1.jpg?raw=true "Home 1") |
| Home Page 2      | ![Alt text](images/home-2.jpg?raw=true "Home 2") | ![Alt text](images/home-2.jpg?raw=true "Home 2") |
| Home Page 3      | ![Alt text](images/home-3.jpg?raw=true "Home 3") | ![Alt text](images/home-3.jpg?raw=true "Home 3") |
| Home Page 4      | ![Alt text](images/home-4.jpg?raw=true "Home 4") | ![Alt text](images/home-4.jpg?raw=true "Home 4") |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |
|                  |                                                  |                                                  |




## Running Locally
After cloning this repository, migrate to ```flutter-amazon-clone-tutorial``` folder. Then, follow the following steps:
- Create MongoDB Project & Cluster
- Click on Connect, follow the process where you will get the uri.- Replace the MongoDB uri with yours in ```server/index.js```.
- Head to ```lib/constants/global_variables.dart``` file, replace <yourip> with your IP Address. 
- Create Cloudinary Project, enable unsigned operation in settings.
- Head to ```lib/features/admin/services/admin_services.dart```, replace ```denfgaxvg``` and ```uszbstnu``` with your Cloud Name and Upload Preset respectively.

Then run the following commands to run your app:


### Client Side
```bash
  flutter pub get
  open -a simulator (to get iOS Simulator)
  flutter run
```

## Tech Used

**Client**: Flutter

##Dependencies
- cupertino_icons: ^1.0.2
- carousel_slider: ^4.1.1
- json_serializable: ^6.4.1
- json_annotation: ^4.7.0
- flutter_rating_bar: ^4.0.1
- modal_progress_hud_nsn: ^0.3.0
- csc_picker: ^0.2.6
- font_awesome_flutter: ^10.2.1
- cached_network_image: ^3.2.2
- connectivity_plus: ^3.0.2
- file_picker: ^5.2.5
- badges: ^2.0.3
    
## Feedback

If you have any feedback, please reach out to me at adebolasanni079@gmail.com
