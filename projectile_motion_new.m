clc; clearvars; close all;

%% Inputs
u = input('Enter initial velocity (m/s): ');
theta = input('Enter launch angle (degrees): ');
theta = deg2rad(theta);

g = 9.8;

%% Time of flight
T = (2*u*sin(theta))/g;
t = linspace(0, T, 1000);

%% Trajectory equations
x = u*cos(theta).*t;
y = u*sin(theta).*t - 0.5*g*t.^2;

max_height = max(y);
range_val = max(x);

fprintf('Maximum Height: %.2f m\n', max_height);
fprintf('Range: %.2f m\n', range_val);

%% Plot setup
figure;
hold on;
grid on;

xlabel('Distance (m)');
ylabel('Height (m)');
title('Projectile Motion Simulation');

xlim([0 range_val + 1]);
ylim([0 max_height + 1]);

plot(x, y, '--k'); % full trajectory line


%% Animation
h = plot(0, 0, 'r*', 'MarkerFaceColor', 'b');

for i = 1:length(t)
    set(h, 'XData', x(i), 'YData', y(i));
    pause(0.02);
end