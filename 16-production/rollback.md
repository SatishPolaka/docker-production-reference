# Rollback

Keep the previous known-good image available in the registry. Record its digest and configuration version. If the new release fails health checks or agreed service indicators, redeploy the previous image and verify the service.

For stateful applications, confirm database schema and data compatibility. Reverting a container image does not reverse database migrations or restore lost data.
