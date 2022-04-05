clear all
close all
clc

Viconbag = rosbag('11_17_test.bag');
bsel = select(Viconbag,'Topic','/vrpn_client_node/kritt/pose');
allMsgs = readMessages(bsel);
for i=1:Viconbag.NumMessages
    x(i) = allMsgs{i,1}.Pose.Position.X;
    y(i) = allMsgs{i,1}.Pose.Position.Y;
    z(i) = allMsgs{i,1}.Pose.Position.Z;
    position(1:3,i) = [x(i),y(i),z(i)];
end
ax=.1;
plot3(x,y,z, 'LineWidth',1.5)
grid on
az = 40;
el = 40;
view(az,el);
save test_50hz_skippoint_ob.mat x y z
save test_50hz_skippoint_ob_3x1.mat position