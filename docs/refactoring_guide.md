# Refactoring Guide (Atomic Design)

## Widget Mapping

- `FeedBody` → Organism composition via `CustomScrollView`
- `Search bar` → Molecule `SearchBarButton`
- `Categories strip` → Organism `CategoriesStrip` + Atom `LabelChip`
- `Deals of the Day` → Organism `DealsSection` + Molecule `DealCard`
- `Promo banner` → Organism `PromoSection` + Molecule `PromoCard`
- `Carousel` → Organism `HeroCarousel`

## Data Injection

UI reads data from `ProductRepository` through Riverpod providers:

- `featuredProductsProvider`
- `categoriesProvider`

Swap the repository implementation to point to a real backend without touching UI.

## Theme + Config

All copy/assets live in `AppConfig`:

- `lib/config/app_config.dart`
- Theme tokens in `AppThemeExtension`
