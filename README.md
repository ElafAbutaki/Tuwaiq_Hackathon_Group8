# 🏠 Darkom – Real Estate Management & Renting App

Darkom is a **Flutter-based real estate application** designed to simplify renting and managing properties in Saudi Arabia. The app enables property owners to list, monitor, and manage their properties, while tenants can view details, contracts, and communication in one unified interface.

---

## 📱 Overview

Darkom provides a seamless user experience through modern Flutter UI components, responsive layouts, and localized Arabic support. The app integrates elegant screens for **property management**, **chat communication**, **lock control**, and **Nafath-based authentication** for trusted access.

---

## 🎨 Figma Design

🖌️ *View the full UI/UX design here:*
[🔗 Figma Prototype Link](https://www.figma.com/design/Yp1me8zvjjDxCTDnVYjK31/%D8%AF%D8%A7%D8%B1%D9%83%D9%85-%7C-Hackathon-Project?node-id=722-6949&t=FUVk2yhZo1unZGl3-1)


---

## 🧭 Table of Contents

* [Features](#-features)
* [Folder Structure](#-folder-structure)
* [Tech Stack](#-tech-stack)
* [Setup Instructions](#-setup-instructions)
* [Screenshots](#-screenshots)
* [Contributors](#-contributors)

---

## ✨ Features

### 🔑 Authentication

* **Nafath ID login and OTP verification** (simulated flow).
* **Secure access** with state management in controllers.

### 🏘️ Property Management

* View detailed property information (price, location, description).
* Display real-time status: “Available”, “Not Available”, “Late Exit”.
* Integrated Google Maps to show property locations.

### 🧾 Tenant & Contract Management

* Tenant details and rating display.
* Contract attachments with download/delete options.
* Eviction process request screen for landlords.

### 💬 Chat & Communication

* Direct in-app messaging between landlords and tenants.
* Structured UI for recent conversations and message bubbles.

### 🔒 Smart Lock Screen

* Simulated property lock interface using **custom-designed lock controls**.

### ⚙️ Settings & User Profile

* Change theme, manage privacy settings, and log out.

---

## 🧩 Folder Structure

Below is a simplified version of your **organized architecture**:

```
lib/
│
├── App_Theme/
│   ├── app_colors.dart
│   ├── app_sizes.dart
│   └── app_text.dart
│
├── Feature_Chat_Screen/
│   ├── Screen/chat_screen.dart
│   └── Widgets/
│       ├── chip_categories.dart
│       ├── custom_chat.dart
│       └── example_messages.dart
│
├── Feature_Home_Screen/
│   ├── Screen/home_screen.dart
│   └── Widget/
│       ├── header.dart
│       └── news_card.dart
│
├── Feature_Properties_Screen/
│   ├── Controller/property_controller.dart
│   ├── Screen/
│   │   ├── property_listing_screen.dart
│   │   └── property_details_screen.dart
│   └── Widgets/
│       ├── property_listing.dart
│       └── search_bar.dart
│
├── Feature_Settings_Screen/
│   ├── Screen/settings_screen.dart
│   └── Widgets/
│       ├── logout_button.dart
│       ├── renewal_button.dart
│       ├── setting_list.dart
│       └── user_header.dart
│
├── Feature_Splash_Screen/
│   └── Screen/splash_screen.dart
│
├── Reusable_Widgets/
│   ├── Controller/bottom_nav_controller.dart
│   └── Widgets/
│       ├── back_button.dart
│       ├── bottom_nav.dart
│       ├── emerald_button.dart
│       └── text_button.dart
│
└── main.dart
```

---

## 🛠️ Tech Stack

| Category               | Technology                |
| ---------------------- | ------------------------- |
| **Frontend Framework** | Flutter                   |
| **Language**           | Dart                      |
| **UI Framework**       | Material Design           |
| **State Management**   | Controller-based (Custom) |
| **API Integration**    | Google Maps Flutter SDK   |
| **Design Tools**       | Figma                     |
| **Version Control**    | Git & GitHub              |

---

## 🚀 Setup Instructions

1. **Clone this repository:**

   ```bash
   git clone https://github.com/ElafAbutaki/darkom_app.git
   cd darkom_app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the project:**

   ```bash
   flutter run
   ```

4. (Optional) **Enable Google Maps API Key:**

   * Add your key to `android/app/src/main/AndroidManifest.xml`
   * Example:

     ```xml
     <meta-data android:name="com.google.android.geo.API_KEY" android:value="YOUR_API_KEY_HERE" />
     ```

---

## 🖼️ Screenshots

### Splash & Onboarding

*(Insert your screenshots below — replace image paths as needed)*
![Splash Screen](https://github.com/user-attachments/assets/yourimage1.png)
![Onboarding](https://github.com/user-attachments/assets/yourimage2.png)

---

### Home & Property Details

![Home Screen](https://github.com/user-attachments/assets/yourimage3.png)
![Property Details](https://github.com/user-attachments/assets/yourimage4.png)

---

### Chat & Settings

![Chat Screen](https://github.com/user-attachments/assets/yourimage5.png)
![Settings Screen](https://github.com/user-attachments/assets/yourimage6.png)

---

## 👥 Contributors

| Name                     | Role                                    |
| ----------------         | --------------------------------------- |
| **Elaf Abutaki**         | Flutter Developer                       |
| **Abdulaziz Abdulwahab** | Flutter Developer                       |
| **Lujain Alshehri**      | UI/UX Designer                          |
| **Seren Baoqail**        | UI/UX Designer                          |
| **Abdulmohsen Alali**    | UI/UX Designer                          |

---

## 🧾 License

This project is for academic and demonstration purposes only.

---
