% Bluetooth Signal Detection and Visualization Tool
% This tool scans for Bluetooth devices and visualizes the RSSI.

% Step 1: Prompt the user to scan for Bluetooth devices
disp('Scanning for nearby Bluetooth devices...');
devices = bluetoothlist; % Scan for Bluetooth devices

% Step 2: Check if any devices are found
if isempty(devices)
    disp('No Bluetooth devices found in the vicinity.');
else
    disp('Bluetooth devices found:');
    disp(devices);
    
    % Step 3: Extract device names and their corresponding RSSI (Signal Strength)
    device_names = devices.Name; % Device names
    device_addresses = devices.Address; % Device MAC addresses
    rssi_values = devices.RSSI; % RSSI (signal strength)
    
    % Step 4: Plot the data
    figure;
    bar(rssi_values, 'FaceColor', [0.2, 0.6, 0.2]);
    title('Bluetooth Devices - Signal Strength (RSSI)');
    xlabel('Device Index');
    ylabel('RSSI (dBm)');
    set(gca, 'XTickLabel', device_names, 'XTick', 1:length(device_names));
    xtickangle(45); % Rotate labels for better readability
    grid on;
    
    % Step 5: Display additional information
    fprintf('\nBluetooth Devices Found: \n');
    for i = 1:length(device_names)
        fprintf('Device %d: %s (Address: %s, RSSI: %d dBm)\n', ...
                i, device_names{i}, device_addresses{i}, rssi_values(i));
    end
end
