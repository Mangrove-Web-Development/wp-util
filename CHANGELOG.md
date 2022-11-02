# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning].

[Semantic Versioning]: https://semver.org/spec/v2.0.0.html

## [Unreleased]
### Added
- `import-db` uses $LOCAL_DEV_DOMAIN for site URL.
- `import-db` sets local password for mangrove-team user.

## [1.1.0] - 2021-04-26
### Added
- `download-themes` script.
- Changelog.
- Path prefixes for download directory scripts.

### Removed
- LFTP workaround for unknown hosts.

### Fixed
- `wp-init` now uses valid email address.
