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

- **Landing / Home Page**  
  ![Home Screenshot](screenshots/home.png)

- **Add New Item Page**  
  ![Add Item Screenshot](screenshots/add_item.png)

- **Dismiss / Delete Item**  
  ![Delete Item Screenshot](screenshots/delete.png)

---

## 🏗️ Tech Stack

- **Frontend**: Flutter (Dart)  
- **Backend**: Firebase Realtime Database  
- **State Handling**: Stateful Widgets + `FutureBuilder`  
- **HTTP Communication**: `http` package for API calls  

---

## 📂 Project Structure

 lib/
├── data/
│ └── categories.dart # Category definitions
├── models/
│ ├── category.dart # Category model
│ └── grocery_item.dart # Grocery item model
├── widgets/
│ ├── grocery_list.dart # Main list screen
│ └── new_item.dart # Form to add new items
└── main.dart # App entry point


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


