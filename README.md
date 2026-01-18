# E-commerce Flutter App

A modern Flutter e-commerce application with a clean UI featuring product browsing, detailed product views, and checkout functionality.

<img width="933" height="648" alt="Screenshot 2026-01-18 154617" src="https://github.com/user-attachments/assets/6920b9cf-9e4d-45d1-b30c-10f49515f6cb" />


## Features

- **Home Screen**: Browse products with category filters, search, and featured deals
- **Product Detail**: View product details with size/color selection and add to cart
- **Checkout**: Review cart items, manage quantities, and complete purchase

## Quick Start

```bash
flutter pub get
flutter run
```

## Tech Stack

- Flutter 3.10+
- Riverpod (State Management)
- GoRouter (Navigation)
- DummyJSON API (Product Data)

## Project Structure

```
lib/
  app/                 # App shell + routing
  features/            # Home, Product Detail, Cart
  design_system/       # UI components (atoms/molecules/organisms)
  data/                # API clients + repositories
  domain/              # Entities + interfaces
  config/              # App configuration
```

## Routes

- `/` - Home page
- `/product/:id` - Product detail
- `/cart` - Checkout page
- `/category/:id` - Category view
