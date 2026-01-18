# E-commerce Flutter App

A modern Flutter e-commerce application with a clean UI featuring product browsing, detailed product views, and checkout functionality.

![App Screenshots](screenshots/app-layout.png)

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
