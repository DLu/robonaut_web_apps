# robonaut_web_apps

## Setup 

### Repository Access
Let us assume that you have a fresh Ubuntu 14.04 install ready to go. You will need access to the following repositories. 
 * https://bitbucket.org/traclabs/affordance_templates
 * https://bitbucket.org/nasa_ros_pkg/nasa_r2_common
 * https://bitbucket.org/nasa_ros_pkg/nasa_r2_simulator
 * https://bitbucket.org/traclabs/navigation_planner
 * https://bitbucket.org/traclabs/robot_interaction_tools
 * https://github.com/DLu/nasa_valves
 * https://github.com/DLu/nasa_valves
 * https://github.com/DLu/affordance_template_js
 * https://github.com/DLu/robonaut_web_apps (this repo)
 
These setup instructions assume that you have SSH keys setup with both bitbucket and github, and that those security credentials are available on the machine you're installing on (either by copying the key to .ssh or using SSH Agent forwarding)

### Download and run scripts
Run the following command to download two setup scripts. 
 * `wget https://raw.githubusercontent.com/DLu/robonaut_web_apps/master/clone.bash`
 
Then run it with 
 * `bash clone.bash`

### Configure the javascript
Create a file called ~/public_html/config.js with the following contents:
 
    var HOST='URL_OF_HOST';

where `URL_OF_HOST` is the public address of the server. This can be a URL such as `HOST='chad.michigan.edu'` or an IP address like `HOST='192.168.1.20'`.

## Running the Web Apps

For all demos that simulate the robonaut, the first step will be to launch 

    roslaunch robonaut_web_apps gazebo.launch
    
If you want to have PointClouds appear, you will need to run this command with an X window. 

The default command listed above launches the robonaut in an empty environment. To add the taskboard, add `taskboard:=true`. To spawn the robot in the International Space Station, add `iss:=True`

Gazebo has finished loading when you see the "`All is well`" message.

### Robonaut Teleop 
After launching Gazebo, launch

    roslaunch robonaut_web_apps demo_robonaut.launch
    
Then navigate in a browser to `URL_OF_HOST/r2.html`. 


### Robonaut Affordance Templates
After launching Gazebo launch

    roslaunch robonaut_web_apps demo_robonaut_wheel.launch

Then navigate in a browser to `URL_OF_HOST/r2_at.html`.



