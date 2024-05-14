#!/bin/bash

#cd $HOME/universal_robots_ws/src
cd ../..

git clone -b boost https://github.com/UniversalRobots/Universal_Robots_Client_Library.git
#git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver.git
git clone https://github.com/shokunin-sony/Universal_Robots_ROS_Driver.git # Fork fromshokunin-sony
git clone -b calibration_devel https://github.com/fmauch/universal_robot.git
git clone https://github.com/ros-industrial/ur_msgs.git
git clone https://github.com/gavanderhoorn/industrial_robot_status_controller.git
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_scaled_controllers.git
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_passthrough_controllers.git
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_cartesian_control_msgs.git
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_controllers_cartesian.git

sudo apt update -qq
cd ..
rosdep update
rosdep install --from-paths src --ignore-src -y

catkin b

