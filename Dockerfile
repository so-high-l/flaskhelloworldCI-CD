FROM python:3.9-slim

# Create and activate a virtual environment
RUN python -m venv /opt/venv

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies inside the virtual environment
RUN /opt/venv/bin/pip install --no-cache-dir --upgrade pip
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port 8000
EXPOSE 8000

# Run the application using Gunicorn
CMD ["/opt/venv/bin/gunicorn", "--workers", "4", "--bind", "0.0.0.0:8000", "app:app"]
