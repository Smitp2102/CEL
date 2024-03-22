% Constants
R_inlet = 0.1; % Inlet radius (m)
R_outlet = 0.2; % Outlet radius (m)
L_pump = 1; % Length of pump (m)
N = 20; % Number of grid points
delta_r = (R_outlet - R_inlet) / N; % Grid spacing
omega = 2000 * 2 * pi / 60; % Angular velocity (rad/s)

% Initialize arrays
r = linspace(R_inlet, R_outlet, N); % Radial positions
Q = zeros(1, N); % Flow rate array
Q(1) = 1; % Inlet flow rate (m^3/s)

% Solve using finite difference method
for i = 2:N
    Q(i) = Q(i-1) + pi * omega * r(i-1)^2 * delta_r;
end

% Create meshgrid for contour plot
[R1, R2] = meshgrid(r, r);

% Calculate flow rate at each radial position
Q_mesh = Q' + pi * omega * R1.^2 * delta_r;

% Plot the contour graph
figure;
contourf(R1, R2, Q_mesh, 'LineWidth', 2);
colorbar;
xlabel('Rinlet (m)');
ylabel('Routlet (m)');
title('Contour Plot of Flow Rate in a Centrifugal Pump at 2000 RPM');
