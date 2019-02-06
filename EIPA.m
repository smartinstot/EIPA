%%%%%%%%%%%% Harmonic Wave Equation in 2D FD and Modes %%%%%%%%%%%%
% By David and Patrobas
% Febuary 6th, 2019
global C;
C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                    % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458; % speed of light

nx = 50;
ny = 50;

dx = 1;
dy = 1;
G = sparse(nx*ny, ny*nx);
alpha = (C.hb^2) / (2 * C.m_0);
for i=1:nx
    for j=1:ny
%        n = j + (1 - 1) * ny;
       G((i-1)*nx+1,(j-1)*nx+1) = -2 / dx^2 + -2 / dy^2;
%        if (j+(i-1-1)*ny > 1)
%            G(i,j+(i-1-1)*ny) = 1 / dx^2;
%        end
%        if (j+(i-1+1)*ny > 1)
%            G(i,j+(i-1+1)*ny) = 1 / dx^2;
%        end
%        if (j-1+(i-1)*ny > 1)
%            G(i,j-1+(i-1)*ny) = 1 / dy^2;
%        end
%        if (j+1+(i-1)*ny > 1)
%            G(i,j+1+(i-1)*ny) = 1 / dy^2;
%        end
    end
end
G(1,:) = 1/dy^2;
G(nx*ny,:) = 1/dy^2;
G(:,1) = 1/dx^2;
G(:,nx*ny) = 1/dx^2;

% [E,D] = eigs(G,9,'SM');
spy(G);
% surf(E);