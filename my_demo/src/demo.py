#! /usr/bin/env python
import rospy
import sys
import copy
import moveit_msgs.msg
import geometry_msgs.msg
import moveit_commander
from std_msgs.msg import Empty
import math
import actionlib

rospy.init_node('test')

moveit_commander.roscpp_initialize(sys.argv)
robot=moveit_commander.RobotCommander()
scene=moveit_commander.PlanningSceneInterface()
group=moveit_commander.MoveGroupCommander('arm')
display_trajectory_publisher=rospy.Publisher('/move_group/display_planned_path',moveit_msgs.msg.DisplayTrajectory)
posetarget=geometry_msgs.msg.PoseStamped()

pose=group.get_current_pose()
print("posetarget" ,pose)

posetarget = pose
posetarget.pose.position.x+=0.05

print(posetarget)
group.set_pose_target(posetarget)
plan=group.plan()
group.go(wait=True)

pose=group.get_current_pose()
print(pose)

