function dx = Motordc(t, x)
% Parámetros del motor DC
Ra = 2;        % Resistencia de armadura [Ohm]
La = 0.023;    % Inductancia de armadura [H]
Ke = 0.01;     % Constante back-EMF [V·s/rad]
Kt = 0.01;     % Constante de torque [N·m/A]
b  = 0.0012;   % Fricción viscosa [N·m·s]
J  = 0.001;    % Momento de inercia [kg·m²]

Va = 5;       % Tensión de entrada (escalón) [V]

% 3 estados:
%   x(1) = theta_m  [rad]    posición angular
%   x(2) = omega_m  [rad/s]  velocidad angular
%   x(3) = ia       [A]      corriente de armadura

dx = zeros(3,1);

% x1punto = theta_punto = omega
dx(1) = x(2);

% x2punto = omega_punto = (Kt*ia - b*omega) / J
dx(2) = (Kt/J)*x(3) - (b/J)*x(2);

% x3punto = ia_punto = (Va - Ke*omega - Ra*ia) / La
dx(3) = (1/La)*Va - (Ke/La)*x(2) - (Ra/La)*x(3);

end