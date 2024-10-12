
clc
clear all
close all

figure;
axis([0 100 0 30]); 
hold on;
grid on;

text(5, 30, 'Computer A ', 'FontSize', 10, 'Color', 'blue');
text(35, 25, 'Router C ', 'FontSize', 10, 'Color', 'red');
text(65, 25, 'Router D ', 'FontSize', 10, 'Color', 'red');
text(95, 30, 'Computer B', 'FontSize', 10, 'Color', 'blue');

fill([7 13 13 7], [18 18 24 24], 'k');  
fill([8.5 11.5 10], [24 24 26], 'k');   

fill([87 93 93 87], [18 18 24 24], 'k');  
fill([88.5 91.5 90], [24 24 26], 'k');  

rectangle('Position', [37 18 6 6], 'Curvature', [1 1], 'FaceColor', 'r'); 
rectangle('Position', [67 18 6 6], 'Curvature', [1 1], 'FaceColor', 'r');  

plot([13 40], [21 21], 'k-', 'LineWidth', 2);  % Path from A to Router C
plot([43 70], [21 21], 'k-', 'LineWidth', 2);  % Path from Router C to Router D
plot([73 90], [21 21], 'k-', 'LineWidth', 2);  % Path from Router D to B

packet = plot(10, 21, 'bo', 'MarkerFaceColor', 'blue', 'MarkerSize', 10);

process_delay_label = text(20, 10, 'Processing Delay: 0', 'FontSize', 8, 'Color', 'black');
queue_delay_label = text(40, 10, 'Queueing Delay: 0', 'FontSize', 8, 'Color', 'black');
transmission_delay_label = text(60, 10, 'Transmission Delay: 0', 'FontSize', 8, 'Color', 'black');
propagation_delay_label = text(80, 10, 'Propagation Delay: 0', 'FontSize', 8, 'Color', 'black');

total_delay_label = text(40, 5, 'Total Delay: 0', 'FontSize', 10, 'Color', 'black');

processing_delay = 0.5; % in seconds
queueing_delay = 1; % in seconds
transmission_delay = 0.7; % in seconds
propagation_delay = 1.2; % in seconds
total_delay = 0;

move_delay = 0.2;

for i = 1:90
    set(packet, 'XData', i);
    if i == 25
        total_delay = total_delay + processing_delay;
        set(process_delay_label, 'String', ['Processing Delay: ', num2str(processing_delay), 's']);
        pause(processing_delay);
    elseif i == 45
        total_delay = total_delay + queueing_delay;
        set(queue_delay_label, 'String', ['Queueing Delay: ', num2str(queueing_delay), 's']);
        pause(queueing_delay);
    elseif i == 65
        total_delay = total_delay + transmission_delay;
        set(transmission_delay_label, 'String', ['Transmission Delay: ', num2str(transmission_delay), 's']);
        pause(transmission_delay);
    elseif i == 85
        total_delay = total_delay + propagation_delay;
        set(propagation_delay_label, 'String', ['Propagation Delay: ', num2str(propagation_delay), 's']);
        pause(propagation_delay);
    end
    
    set(total_delay_label, 'String', ['Total Delay: ', num2str(total_delay), 's']);

    pause(move_delay);
end

hold off;
