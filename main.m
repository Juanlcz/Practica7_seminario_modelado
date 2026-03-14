clear; clc;

% Tiempo de simulación
T = [0 10];

% Condiciones iniciales
theta0 = 0;
omega0 = 0;
ia0 = 0;

x0 = [theta0; omega0; ia0];


% Resolver ecuaciones
[t, x] = ode45(@Motordc, T, x0);

% Variables
theta = x(:,1);
omega = x(:,2);
ia = x(:,3);

% Grafica posicion
figure
plot(t,theta,'LineWidth',1.5)
xlabel('Tiempo (s)')
ylabel('\theta (rad)')
title('Posición Angular')
grid on

% Grafica velocidad
figure
plot(t,omega,'LineWidth',1.5)
xlabel('Tiempo (s)')
ylabel('\omega (rad/s)')
title('Velocidad Angular')
grid on

% Grafica corriente
figure
plot(t,ia,'LineWidth',1.5)
xlabel('Tiempo (s)')
ylabel('i_a (A)')
title('Corriente de Armadura')
grid on