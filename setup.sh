#!/bin/bash

# Define variables
REPO_URL="https://github.com/YashwanthMN1/portfolio.git"
CLONE_DIR="/home/mnt/your-fastapi-app"
LOG_FILE="/var/log/install_and_clone.log"

# Log function for better traceability
log() {
    echo "$(date "+%Y-%m-%d %H:%M:%S") - $1" | tee -a $LOG_FILE
}

# Step 1: Update the system
log "Updating system packages..."
sudo yum update -y >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    log "System updated successfully."
else
    log "Error updating the system."
    exit 1
fi

# Step 2: Install Python3 and pip3
log "Installing Python3 and pip..."
sudo yum install python3 -y >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    log "Python3 installed successfully."
else
    log "Error installing Python3."
    exit 1
fi

# Step 3: Install Git
log "Installing Git..."
sudo yum install git -y >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    log "Git installed successfully."
else
    log "Error installing Git."
    exit 1
fi


# step 3.5 ensure pip3 installed 
python3 -m ensurepip --upgrade
if [ $? -eq 0 ]; then
    log "pip3  installed successfully."
else
    log "Error installing Pip3."
    exit 1
fi


# Step 4: Install Uvicorn and FastAPI
log "Installing FastAPI and Uvicorn..."
pip3 install fastapi uvicorn >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    log "FastAPI and Uvicorn installed successfully."
else
    log "Error installing FastAPI and Uvicorn."
    exit 1
fi

# Step 5: Clone the GitHub repository
log "Cloning the GitHub repository from $REPO_URL..."
git clone $REPO_URL $CLONE_DIR >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    log "Repository cloned successfully to $CLONE_DIR."
else
    log "Error cloning the repository."
    exit 1
fi

# Step 6: Wait for the repo to be fully cloned (Optional - this is more for larger repos)
log "Waiting for repository to be fully cloned..."
sleep 5  # Wait for 5 seconds just in case for large repositories
log "Repository cloning completed."

# Step 7: Run the FastAPI app using Uvicorn
log "Starting FastAPI app with Uvicorn..."
cd $CLONE_DIR
uvicorn app:app --host 0.0.0.0 --port 80 >> $LOG_FILE 2>&1 &

if [ $? -eq 0 ]; then
    log "FastAPI app started successfully."
else
    log "Error starting FastAPI app."
    exit 1
fi

# Final log entry
log "Installation and deployment completed successfully."
