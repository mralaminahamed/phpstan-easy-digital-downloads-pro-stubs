#!/usr/bin/env bash
#
# Generate Easy Digital Downloads Pro + addons stubs from the source directories.
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

HEADER_PRO=$'/**\n * Generated stub declarations for Easy Digital Downloads Pro.\n * @see https://easydigitaldownloads.com\n * @see https://github.com/mralaminahamed/phpstan-easy-digital-downloads-pro-stubs\n */'

HEADER_SL=$'/**\n * Generated stub declarations for EDD Software Licensing.\n * @see https://easydigitaldownloads.com/downloads/software-licensing/\n * @see https://github.com/mralaminahamed/phpstan-easy-digital-downloads-pro-stubs\n */'

HEADER_RECURRING=$'/**\n * Generated stub declarations for EDD Recurring Payments.\n * @see https://easydigitaldownloads.com/downloads/recurring-payments/\n * @see https://github.com/mralaminahamed/phpstan-easy-digital-downloads-pro-stubs\n */'

FILE_PRO="$ROOT_DIR/easy-digital-downloads-pro-stubs.php"
FILE_PRO_CONSTANTS="$ROOT_DIR/easy-digital-downloads-pro-constants-stubs.php"
FILE_SL="$ROOT_DIR/edd-software-licensing-stubs.php"
FILE_SL_CONSTANTS="$ROOT_DIR/edd-software-licensing-constants-stubs.php"
FILE_RECURRING="$ROOT_DIR/edd-recurring-stubs.php"
FILE_RECURRING_CONSTANTS="$ROOT_DIR/edd-recurring-constants-stubs.php"
GENERATOR_BIN="$ROOT_DIR/vendor/bin/generate-stubs"

set -e

for dir in easy-digital-downloads-pro edd-software-licensing edd-recurring; do
    test -d "$ROOT_DIR/source/$dir" || {
        echo "ERROR: Source directory not found: source/$dir"
        echo "Copy the plugin directory from your WP install to source/$dir"
        exit 1
    }
done

for f in "$FILE_PRO" "$FILE_PRO_CONSTANTS" "$FILE_SL" "$FILE_SL_CONSTANTS" "$FILE_RECURRING" "$FILE_RECURRING_CONSTANTS"; do
    test -f "$f" || touch "$f"
done

# EDD Pro
"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$ROOT_DIR/configs/finder-pro.php" \
    --header="$HEADER_PRO" \
    --functions --classes --interfaces --traits \
    --out="$FILE_PRO"

"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$ROOT_DIR/configs/finder-pro.php" \
    --header="$HEADER_PRO" \
    --constants \
    --out="$FILE_PRO_CONSTANTS"

# EDD Software Licensing
"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$ROOT_DIR/configs/finder-sl.php" \
    --header="$HEADER_SL" \
    --functions --classes --interfaces --traits \
    --out="$FILE_SL"

"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$ROOT_DIR/configs/finder-sl.php" \
    --header="$HEADER_SL" \
    --constants \
    --out="$FILE_SL_CONSTANTS"

# EDD Recurring Payments
"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$ROOT_DIR/configs/finder-recurring.php" \
    --header="$HEADER_RECURRING" \
    --functions --classes --interfaces --traits \
    --out="$FILE_RECURRING"

"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$ROOT_DIR/configs/finder-recurring.php" \
    --header="$HEADER_RECURRING" \
    --constants \
    --out="$FILE_RECURRING_CONSTANTS"

echo "All stubs generated successfully."
