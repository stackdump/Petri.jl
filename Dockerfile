# Use official Julia image as base
FROM julia:1.12

# Set working directory
WORKDIR /app

# Copy project files
COPY Project.toml .
COPY src ./src
COPY test ./test

# Set environment variable to skip SSL verification during package installation
# This is necessary in some Docker environments
ENV JULIA_SSL_NO_VERIFY_HOSTS="**"

# Install dependencies
RUN julia --project=. -e 'using Pkg; Pkg.instantiate()'

# Unset the SSL environment variable for runtime
ENV JULIA_SSL_NO_VERIFY_HOSTS=""

# Run tests by default
CMD ["julia", "--project=.", "-e", "using Pkg; Pkg.test()"]
