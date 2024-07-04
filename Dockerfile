# Use an official Python runtime as a parent image
FROM python:3.12.4-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the virtual environment package
RUN python -m venv venv

# Activate the virtual environment and install any needed packages specified in requirements.txt
RUN /bin/bash -c "source venv/bin/activate && pip install --no-cache-dir -r requirements.txt"

# Make port 8080 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Activate the virtual environment and run app.py when the container launches
CMD ["/bin/bash", "-c", "source venv/bin/activate && python app.py"]
