wget https://gist.githubusercontent.com/DLu/9d4c03e8d402a12af0b7/raw/1001c258178c90e3b3f8860c69f645a506feac10/basic_ros_install.sh
bash basic_ros_install.sh
rm basic_ros_install.sh
cd ~/Catkin/src/
git clone -b develop        git@bitbucket.org:traclabs/affordance_templates.git
git clone -b indigo         git@bitbucket.org:nasa_ros_pkg/nasa_r2_common.git
git clone -b indigo         git@bitbucket.org:nasa_ros_pkg/nasa_r2_simulator.git
git clone -b develop        git@bitbucket.org:traclabs/navigation_planner.git
git clone -b traclabs-devel git@bitbucket.org:traclabs/robot_interaction_tools.git
git clone                   git@github.com:DLu/nasa_valves.git
git clone                   git@github.com:DLu/affordance_template_js.git
git clone                   git@github.com:DLu/robonaut_web_apps.git
sudo apt-get -y install ros-indigo-gazebo-* ros-indigo-control-msgs ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-joint-trajectory-controller ros-indigo-moveit-* ros-indigo-tf2-web-republisher ros-indigo-interactive-marker-proxy apache2
rosdep -y -r install affordance_templates robot_interaction_tools nasa_r2_common nasa_r2_simulator navigation_planner affordance_template_js
cd affordance_templates
./config.sh catkin
cd ../..
until catkin_make; do echo "TRY AGAIN"; done
cd
mkdir public_html
sudo sed -e 's/var\/www\/html/home\/'"$USER"'\/public_html/g' -i /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo sed -e 's/var\/www/home\/'"$USER"'\/public_html/g' -i /etc/apache2/apache2.conf
sudo service apache2 restart
cd public_html
ln -s ~/Catkin/src/affordance_template_js/demo/r2_at.html
ln -s ~/Catkin/src/affordance_templates/affordance_template_library
ln -s ~/Catkin/src/nasa_r2_common/r2_description
ln -s ~/Catkin/src/affordance_template_js
ln -s ~/Catkin/src/robonaut_web_apps/html/r2.html
