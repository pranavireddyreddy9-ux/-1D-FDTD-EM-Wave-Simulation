% Simulation of One-Dimensional EM Wave Propagation from Free Space to Medium

close all;
clear all;

% Declaration of physical constants
eps0 = 8.854e-12;
mu0 = 4*pi*1e-7;
c0 = 1/sqrt(mu0*eps0);

% Problem definition
epsr1 = 1;              % Relative permittivity of region 1
epsr2 = 2;              % Relative permittivity of region 2
c1 = c0/sqrt(epsr1);    % Speed of light in region 1
c2 = c0/sqrt(epsr2);    % Speed of light in region 2

% Simulation domain definition
D = 1;                  % Length in metres
tmax = 4.5e-9;          % Simulation time in seconds

% Grid generation
r = 1;                  % FDTD grid parameter
NX = 100;               % No. of spatial grid points
dx = D/(NX-1);          % Spatial grid step size in metres
dt = r*dx/c0;           % Temporal step size in seconds
NT = ceil(tmax/dt);     % No. of time steps
x = 0:dx:D;             % Spatial grid points

% Source specification - Gaussian pulse
t0 = 60*dt;             % Time at pulse centre in seconds
s = 10*dt;              % Pulse width in seconds

% Initialization
u1 = zeros(NX,1);       % Field at past time step
u2 = zeros(NX,1);       % Field at current time step
u3 = zeros(NX,1);       % Field at future time step

% Update equation constants
a1 = (c1*dt/dx)^2 * ones(NX,1);
idx2 = find(x > D/2);
a1(idx2) = (c2*dt/dx)^2;

% Absorbing boundary condition constant
a2 = (sqrt(a1(NX))-1) / (sqrt(a1(NX))+1);

% Time loop
figure(1)
for n = 1:NT

    % Update equation for interior grid points
    u3(2:NX-1) = a1(2:NX-1).*(u2(3:NX) - 2*u2(2:NX-1) + u2(1:NX-2)) ...
                 + 2*u2(2:NX-1) - u1(2:NX-1);

    % Gaussian pulse source at left boundary
    t = n*dt;
    u3(1) = exp(-(t-t0)^2 / (2*s^2));

    % Absorbing boundary condition at right boundary
    u3(NX) = u2(NX-1) + a2*(u3(NX-1) - u2(NX));

    % Plot field
    plot(x, u3)
    ylim([-2 2])
    xlabel('x (m)')
    ylabel('u')
    drawnow

    % Shift field variables in time
    u1 = u2;
    u2 = u3;

end

% Postprocessing
idx1 = find(x < D/2);

% Numerical reflection coefficient
[tmp, idx] = max(abs(u3(idx1)));
R1 = u3(idx)

% Exact reflection coefficient
R2 = (sqrt(1/epsr2) - sqrt(1/epsr1)) / (sqrt(1/epsr2) + sqrt(1/epsr1))