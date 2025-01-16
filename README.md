### Build setup

```bash
# Sync package dependency
$ flutter pub get
# Generate files for packages
$ flutter pub run build_runner build --delete-conflicting-outputs

# Injectable
# Use the [watch] flag to watch the files' system for edits and rebuild as necessary.
$ flutter pub run build_runner watch --delete-conflicting-outputs
```

### Build