# Build and publish

A reliable build should be repeatable and traceable to source. Use a version or commit SHA as the release tag. Consider pinning base images by digest and recording build metadata.

Flow: checkout known revision → tests → image build → image scan → registry login → push immutable tag → record digest → promote the same image between environments. Do not rebuild a different image for production after testing a candidate in staging.