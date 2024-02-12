% Define parameters
L = 1;      % Length of the domain
Nx = 10;    % Number of grid points
dx = L / (Nx - 1); % Grid spacing

% Define thermal conductivity
k = 1;      % Thermal conductivity

% Define boundary temperatures
T_left = 100;
T_right = 200;

% Construct coefficient matrix A
A = zeros(Nx, Nx);
A(1, 1) = 1;
A(Nx, Nx) = 1;
for i = 2:Nx-1
    A(i, i-1) = -k / dx^2;
    A(i, i) = 2 * k / dx^2;
    A(i, i+1) = -k / dx^2;
end

% Construct constant vector b
b = zeros(Nx, 1);
b(1) = T_left;
b(Nx) = T_right;

% Solve the system of equations
T = A \ b;

% Plot the temperature distribution
x = linspace(0, L, Nx);
plot(x, T);
xlabel('Position (x)');
ylabel('Temperature');
title('Temperature Distribution');