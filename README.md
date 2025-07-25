# 🍽️ Reco Genie Internship Task

This project is part of my internship at **Reco Genie**, where I built a full-featured ordering module using Flutter, Firebase, and Clean Architecture principles. It includes:

- Login & Registration
- Menu Page
- Cart Page
- Firebase Firestore & Auth Integration
- CI/CD using GitHub Actions

---

## 🚀 Features

### ✅ Authentication
- Register new users with Firebase Auth
- Login with email and password
- Input validation and user feedback

### 🛒 Cart
- Add to cart
- Remove from cart
- Update item quantity
- Total price calculation
- clear cart

### 📦 Orders
- View list of available dishes/items
- Add to cart 

---

## 🔌 Technologies

| Tech               | Usage                             |
|--------------------|------------------------------------|
| Flutter            | UI Framework                      |
| Firebase Auth      | Authentication                    |
| Cloud Firestore    | Realtime Database for orders/cart |
| Bloc (Cubit)       | State Management                  |
| Get It             | Service Locator for DI            |
| Injectable         | Code generator for get it         |
| GitHub Actions     | CI/CD Pipeline (analyze, format, push) |
| Dart Linter        | Code quality checks               |

---

## 📽️ Video Demo link

Watch a short walkthrough of the app in action:
https://drive.google.com/file/d/1YOEE76l2qlVztsH4yFV9YT9_IWOf-tnG/view?usp=drive_link


---
## 🧪 GitHub Actions CI/CD

A GitHub Actions workflow is included to:
- Run `flutter analyze`
- Format Dart code
- Auto-commit formatted code
- Trigger on push or pull requests

See `.github/workflows/code_linter_check.yml` for details.

---

## 🔧 How to Run Locally

```bash
# 1. Clone the repo
git clone https://github.com/your-username/reco_genie_intern_task.git
cd reco_genie_intern_task

# 2. Get packages
flutter pub get

# 3. Run on device or emulator
flutter run
