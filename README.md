# 🛒 Shopping List App (Flutter + Firebase)

A simple yet powerful **Shopping List app** built with **Flutter** and **Firebase Realtime Database**.  
The app allows you to add, view, and remove grocery items with categories, all synced in real time.

---

## ✨ Features

- 📌 **Add Grocery Items** with:
  - Name  
  - Quantity  
  - Category (e.g., Vegetables, Fruits, Dairy, etc.)  

- 🗑️ **Remove Items** easily by sliding/dismissing a list item.  

- 🔄 **Realtime Sync with Firebase Realtime Database**  
  - Items are saved to Firebase.  
  - Items are fetched when the app is opened.  

- 🛠️ **Form Validation**  
  - Ensures proper item names.  
  - Prevents invalid or negative quantities.  

- 🚦 **Error Handling**  
  - Displays error messages if Firebase connection fails.  
  - Shows loading indicator while fetching.  

- 🎨 **Clean UI**  
  - Category color indicators.  
  - Minimal and intuitive design.  

---

## 📸 Screenshots

> Replace the placeholders below with your app screenshots.

- **Landing / Home Page** ||          **Add New Item Page** ||             **Updating / Saving Item** 
  <p align="center"> 
 <img src="https://github.com/subhava06/PocketCart/blob/eb741688e18ad149569f3b643ba9c2334f46b752/Screenshot%202025-09-14%20203720.png?raw=true" width="30%" style="margin: 10px;" /> <img src="https://github.com/subhava06/PocketCart/blob/eb741688e18ad149569f3b643ba9c2334f46b752/Screenshot%202025-09-14%20203640.png?raw=true" width="30%" style="margin: 10px;" /> 
 <img src="https://github.com/subhava06/PocketCart/blob/eb741688e18ad149569f3b643ba9c2334f46b752/Screenshot%202025-09-14%20202636.png?raw=true" width="30%" style="margin: 10px;" /> </p>

  
 

 
 

---

## 🏗️ Tech Stack

- **Frontend**: Flutter (Dart)  
- **Backend**: Firebase Realtime Database  
- **State Handling**: Stateful Widgets + `FutureBuilder`  
- **HTTP Communication**: `http` package for API calls  

---

## 📂 Project Structure
<p>
 lib/ <br>
├── data/ <br>
│ └── categories.dart # Category definitions <br>
├── models/ <br>
│ ├── category.dart # Category model <br>
│ └── grocery_item.dart # Grocery item model <br>
├── widgets/ <br>
│ ├── grocery_list.dart # Main list screen <br>
│ └── new_item.dart # Form to add new items <br>
└── main.dart # App entry point <br>
</p>

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/shopping-list-app.git
   cd shopping-list-app
   flutter pub get
   flutter run


🔐 Firebase Setup

1.Create a Firebase project at Firebase Console

2.Enable Realtime Database.

3.Add your Flutter app to Firebase and download google-services.json.

4.Place it inside android/app/.

5.Update Firebase rules (temporary open or with auth):

{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}


📌 Future Improvements

✅ Authentication with Firebase Auth (Google / Email login).

✅ User-specific shopping lists.

✅ Edit existing grocery items.

✅ Dark mode theme.


🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

📜 License

This project is licensed under the MIT License.
You are free to use, modify, and distribute this code with attribution.


