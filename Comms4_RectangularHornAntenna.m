% Name oof Antenna: Rectangular Horn Antenna
% Name of members:
% Atienza, Mary Joy P.
% Corpiz, Mariell Mae S.
% Lizada, Roneline C.
% Section: BSECE 3B

clc; clear; close all;

% Constants
lambda = 1;              % Normalized wavelength
k = 2*pi/lambda;         % Wave number

a = 1.5 * lambda;        % Aperture width (x-axis)
b = 1.0 * lambda;        % Aperture height (y-axis)

% Angular Grid for Far Field
theta = linspace(0, pi, 180);        % Elevation angle [0, π]
phi = linspace(0, 2*pi, 360);        % Azimuth angle [0, 2π]
[TH, PH] = meshgrid(theta, phi);     % Create angular grid

% Compute direction cosines
kx = k * a/2 .* sin(TH) .* cos(PH);
ky = k * b/2 .* sin(TH) .* sin(PH);

% Custom sinc function: sinc(x) = sin(x)/x
% Used logical indexing to avoid division by zero
Fx = ones(size(kx));
Fy = ones(size(ky));

nonzero_kx = kx ~= 0;
nonzero_ky = ky ~= 0;

Fx(nonzero_kx) = sin(kx(nonzero_kx)) ./ kx(nonzero_kx);
Fy(nonzero_ky) = sin(ky(nonzero_ky)) ./ ky(nonzero_ky);

% Radiation pattern: product of sinc terms
Gain = abs(Fx .* Fy);
Gain = Gain / max(Gain(:));   % Normalize

% Convert to Cartesian Coordinates
R = Gain;
X = R .* sin(TH) .* cos(PH);
Y = R .* sin(TH) .* sin(PH);
Z = R .* cos(TH);

% Plot 3D Radiation Pattern
figure('Color','w')
surf(X, Y, Z, R);         % Use R for color mapping
shading interp
axis equal
colormap turbo
colorbar
clim([0 1])
title('3D Radiation Pattern of Rectangular Horn Antenna')
xlabel('X'); ylabel('Y'); zlabel('Z')
grid on

% Add Simplified Rectangular Horn Model
hold on
horn_length = 0.2;
horn_w = a / 2;
horn_h = b / 2;

% Horn pyramid vertices 
V = [ 0, 0, 0;                             % Tip (origin)
     -horn_w, -horn_h, horn_length;
      horn_w, -horn_h, horn_length;
      horn_w,  horn_h, horn_length;
     -horn_w,  horn_h, horn_length];

% Faces
F = [1 2 3; 1 3 4; 1 4 5; 1 5 2];

% Plot horn patch
patch('Vertices', V, 'Faces', F, ...
      'FaceColor', [0.5 0.5 0.5], ...
      'EdgeColor', 'k', ...
      'FaceAlpha', 0.7);

% Adjust View
view(45, 30)
lighting gouraud
camlight headlight
