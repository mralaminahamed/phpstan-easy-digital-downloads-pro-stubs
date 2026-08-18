# Easy Digital Downloads Pro Stubs

[![Latest Version](https://img.shields.io/packagist/v/mralaminahamed/easy-digital-downloads-pro-stubs.svg?color=4CC61E&style=flat-square)](https://packagist.org/packages/mralaminahamed/easy-digital-downloads-pro-stubs)
[![Downloads](https://img.shields.io/packagist/dt/mralaminahamed/easy-digital-downloads-pro-stubs.svg?style=flat-square)](https://packagist.org/packages/mralaminahamed/easy-digital-downloads-pro-stubs/stats)
[![License](https://img.shields.io/packagist/l/mralaminahamed/easy-digital-downloads-pro-stubs.svg?style=flat-square)](./LICENSE)
[![PHP Version](https://img.shields.io/packagist/php-v/mralaminahamed/easy-digital-downloads-pro-stubs.svg?style=flat-square)](./composer.json)

PHP stub declarations for **Easy Digital Downloads Pro** (3.6.7) including:

- [EDD Pro](https://easydigitaldownloads.com) — core EDD Pro classes and functions
- [EDD Software Licensing](https://easydigitaldownloads.com/downloads/software-licensing/) (3.9.6) — license key management
- [EDD Recurring Payments](https://easydigitaldownloads.com/downloads/recurring-payments/) (2.13.11) — subscription billing

Generated using [php-stubs/generator](https://github.com/php-stubs/generator) from the actual plugin source.

> **Note:** This package requires a valid EDD Pro license for use with the actual plugins. The stubs are for static analysis only and do not include any executable EDD Pro code.

## Features

- Complete function, class, and interface declarations for EDD Pro + addons
- Constant definitions for proper static analysis
- Separate stub files per addon for granular control
- PHPStan integration

## Requirements

- PHP >= 7.4
- Composer
- [mralaminahamed/easy-digital-downloads-stubs](https://github.com/mralaminahamed/phpstan-easy-digital-downloads-stubs) (installed automatically)

## Installation

```bash
composer require --dev mralaminahamed/easy-digital-downloads-pro-stubs
```

## Configuration

### PHPStan (`phpstan.neon`)

```neon
parameters:
    scanFiles:
        # EDD free (required by this package)
        - vendor/mralaminahamed/easy-digital-downloads-stubs/easy-digital-downloads-stubs.php
        - vendor/mralaminahamed/easy-digital-downloads-stubs/easy-digital-downloads-constants-stubs.php
        # EDD Pro
        - vendor/mralaminahamed/easy-digital-downloads-pro-stubs/easy-digital-downloads-pro-stubs.php
        - vendor/mralaminahamed/easy-digital-downloads-pro-stubs/easy-digital-downloads-pro-constants-stubs.php
        # Software Licensing (include only if you use this addon)
        - vendor/mralaminahamed/easy-digital-downloads-pro-stubs/edd-software-licensing-stubs.php
        - vendor/mralaminahamed/easy-digital-downloads-pro-stubs/edd-software-licensing-constants-stubs.php
        # Recurring Payments (include only if you use this addon)
        - vendor/mralaminahamed/easy-digital-downloads-pro-stubs/edd-recurring-stubs.php
        - vendor/mralaminahamed/easy-digital-downloads-pro-stubs/edd-recurring-constants-stubs.php
```

## Stub Files

| File | Contents |
|------|----------|
| `easy-digital-downloads-pro-stubs.php` | EDD Pro classes, functions, interfaces, traits |
| `easy-digital-downloads-pro-constants-stubs.php` | EDD Pro constants |
| `edd-software-licensing-stubs.php` | Software Licensing classes and functions |
| `edd-software-licensing-constants-stubs.php` | Software Licensing constants |
| `edd-recurring-stubs.php` | Recurring Payments classes and functions |
| `edd-recurring-constants-stubs.php` | Recurring Payments constants |

## Regenerating Stubs

Requires access to the EDD Pro plugin files (commercial license required):

```bash
# Copy plugin sources (from WP install or downloaded zips)
cp -r /path/to/wp/plugins/easy-digital-downloads-pro source/
cp -r /path/to/wp/plugins/edd-software-licensing source/
cp -r /path/to/wp/plugins/edd-recurring source/

# Install dependencies and generate
composer install
composer generate
```

## Related Packages

- [phpstan-easy-digital-downloads-stubs](https://github.com/mralaminahamed/phpstan-easy-digital-downloads-stubs) — EDD free stubs (included as dependency)

## License

MIT. See [LICENSE](./LICENSE).

> The EDD Pro plugin itself is proprietary software by Sandhills Development. These stubs are independently generated type declarations for static analysis purposes only.
