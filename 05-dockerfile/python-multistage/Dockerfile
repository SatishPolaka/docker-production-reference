FROM python:3.12-slim AS builder                 # Builder stage for preparing dependencies
WORKDIR /build                                   # Set the build working directory
COPY requirements.txt .                         # Copy dependency list first for cache reuse
RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt # Build dependency wheels

FROM python:3.12-slim AS runtime                 # Runtime stage without build tooling
ENV PYTHONDONTWRITEBYTECODE=1                    # Avoid writing bytecode files
ENV PYTHONUNBUFFERED=1                           # Send application logs directly to output
WORKDIR /app                                     # Set application working directory
COPY --from=builder /wheels /wheels              # Copy prepared dependency wheels
COPY requirements.txt .                         # Copy dependency list into runtime stage
RUN pip install --no-cache-dir --no-index --find-links=/wheels -r requirements.txt \
    && useradd --create-home --uid 10001 appuser # Install dependencies and create non-root user
COPY --chown=appuser:appuser . /app              # Copy application with correct ownership
USER 10001                                      # Run application as non-root user
EXPOSE 8000                                      # Document application port
CMD ["python", "app.py"]                         # Start the application
