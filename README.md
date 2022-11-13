# Jumier

A fully functional clone of the Jumia NG mobile shopping application built with Flutter for the mobile client and Node.js for the backend service.

## Requirements

- [Flutter SDK and Dart](https://docs.flutter.dev/get-started/install?gclid=CjwKCAjwsfuYBhAZEiwA5a6CDKg0IENEmEpQRDwt-8cTHp6FIf8UMET-3zG9M-oiQBlKAq_imDRKgRoCnpsQAvD_BwE&gclsrc=aw.ds)
- [Android Emulator or iOS simlator](https://developer.android.com/studio?gclid=CjwKCAjwsfuYBhAZEiwA5a6CDNqyXXrWHoSk3KMamypQGg5z5MH933GAS-UYDfDMD8-OnUCSAmSHgBoC-AUQAvD_BwE&gclsrc=aw.ds#downloads)
- Physical android/iOS device can also be used in place of emulator.

## Features Implemented

- `Authentication` - User can either login to their existing account or Signup to create a new account. Minimal information is required to be provided by user to simplify the process.

- `Account` User account specific actions and views, they include;

  - acounts screen
  - wishlist
  - vouchers
  - signing out
  - account type management and,
  - user orders.
    ![Alt text](images/import-collection-1.png?raw=true "Image 1")

- `Admin` These functionalities are only available to an account signed in as an admin account. Admin functionalities include the following:

  - Viewing all products
    ![Alt text](images/import-collection-1.png?raw=true "Image 1")
  - adding a new product
    ![Alt text](images/import-collection-1.png?raw=true "Image 1")
  - Orders analytics
    ![Alt text](images/import-collection-1.png?raw=true "Image 1")
  - Viewing all orders and altering the progress stage of the order
    ![Alt text](images/import-collection-1.png?raw=true "Image 1")

- `Shopping Cart` The cart can be used by signedin user and unsigned-in account. However, an order cannot be created without the user being signed into their account.
