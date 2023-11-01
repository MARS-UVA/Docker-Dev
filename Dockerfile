# Use an official ROS base image
FROM ros:noetic

# Set the working directory in the container
WORKDIR /catkin_ws

ENV ROS_DISTRO noetic

# Add ROS sources and keys
RUN apt-get update && apt-get install -y \
    python3-rosdistro \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install ROS Navigation Stack and other dependencies
RUN apt-get update && apt-get install -y \
    ros-noetic-navigation \
    ros-noetic-move-base-msgs \
    && rm -rf /var/lib/apt/lists/*

# Clone your MARS - ROS repository and submodules
RUN git clone --recursive https://github.com/MARS-UVA/mars-ros.git src

# Install python3-serial using pip3
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install pyserial

# Install ROS development tools and create a catkin workspace
RUN apt-get update && apt-get install -y \
    python3-catkin-tools

# Update rosdep and install ROS dependencies
RUN rosdep update && \
    rosdep install -y --from-paths src --ignore-src --rosdistro noetic

# Source the ROS setup.bash file
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc

# Build your ROS packages
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin build"

# Expose necessary ROS ports (if needed)
# EXPOSE ...

# Start the ROS environment when the container runs
CMD [ "bash" ]
