clear;
close all;
clc;

%% Drive Cycle
load 'Data/drive_cycle.mat';
spd_time_in_s = time_in_s;
spd_velocity = velocity_in_mph;
%time_step = spd_time_in_s(2) - spd_time_in_s(1);
drive_cycle = [spd_time_in_s spd_velocity];
clear time_in_s velocity_in_mph;
%% Hellcat Parameters:
g = 9.81;                 % m/s^2
m = 4428*0.453592;        % kg
wheelbase = 116 * 0.0254; % m
h = 24.5 * 0.0254;        % m
Cd = 0.38;
A = 3751 * 0.00064516;    % m^2
den = 1.21;               % kg/m^3
FDR = 3.70;               % Final Drive Ratio
R = 364/1000;             % m
fr = 0.015; 
u = 1.1;
a = wheelbase*0.55;       %m
b = wheelbase-a;          %m
MaxAcc = (u*a*g) / (a + b - h*u); %m/s^2
MaxTrac = u * m * (a*g+h*MaxAcc) / wheelbase / 1000;  % KN
gas_den=0.74;
acc_power = 2;            % kW

%% Engine Parameters:
load 'Data/Eng_Data.mat';
%acc_torque = 10;

%% Motor Parameters
load 'Data/Electric_Motor_Data.mat';
EM_torque_Nm = EM_torque_Nm * 3;    % Scaled up the motor appropriately

%% Transmission Parameters
gear_ratio = 8;
eff_motor   = 0.85;      % [%]
eff_generator = 0.85;    % [%]
eff_transmission  = 0.95;% [%]
eff_batt = 0.9;          % [%]

%% Battery parameters
load 'Data/Battery_Data.mat';
clear RPM_mot T_mot_in_Nm time_in_s mot;
batt.num_cells = 90;    % total number of cells
batt.num_cell_series = 90;  % number of cells in series
batt.num_module_parallel = 80;   % number of modules in parallel
batt.volt_nom = 3.6;    % nominal voltage in V
batt.volt_max = 3.9;    % max voltage in V
batt.volt_min = 3.2;    % min voltage in V
batt.curr_chg_max = -154.9821;  % max charging current in A
batt.curr_dis_max = 218.75;     % max discharging current in A
batt.soc_max = 0.8;     % max SoC
batt.soc_min = 0.3;     % min SoC
batt.soc_init = 0.6015;     % initial SoC
batt.col_eff.temperature = [0,25,41]; % temperature vector for coulombic efficiency in C
batt.col_eff.col_eff = [0.9680,0.9900,0.9920];  % coulombic efficiency vector 

%% thermal parameters
batt.mass_per_cell = 0.0126; % mass per cell in kg
batt.cp_cell = 795; % heat capacity of battery cell in J/(kg K)
batt.cp_coolant = 3784; % heat capacity of coolant in J/(kg K)
batt.heat_trans_coeff = 20.53; % heat transfer coefficient in J/(m^2 K)
batt.eff_area = 0.775;  % heat transfer effective area in m^2
batt.amb_temp = 300;    % ambient temperature in K
batt.coolant_temp_in = 300; % coolant intake temperature in K
batt.coolant_mass = 0.57;  % total mass of coolant in the cooling system
mass_flow_rate = 0.01;  % [kg/s]

%% Motor torque and RPM profile
% REMY_mot_torque  = [325, 325, 325, 325, 325, 325, 300, 250, 200, 150, 125, 100, 95, 90, 80, 75, 70, 65, 60, 55, 50]';  
% REMY_mot_RPM     = [0:500:10000];

%% Run the Simlation
useDriveCycle = 1;
sim_time = spd_time_in_s(end);
output = sim('Powertrain_Simulation.slx', sim_time);

%% Data gathered from running the model
% SOC
figure
plot(output.SOC, 'g','LineWidth',2)
title('SOC vs Time')
xlabel('Time [s]')
ylabel('SOC')
grid on

% Open Circuit Voltage
figure
plot(output.VOC,'b', 'LineWidth',2)
title('Open Charge Circuit VOC vs Time')
xlabel('Time [s]')
ylabel('Voltage [V]')
grid on

% Terminal Voltage
figure
plot(output.terminalVoltage,'r', 'LineWidth',1)
title('Terminal Voltage Vs Time')
xlabel('Time [s]')
ylabel('Voltage [V]')
grid on

% Output Power
figure
plot(output.Power,'c', 'LineWidth',1)
title('Power Vs Time')
xlabel('Time [s]')
ylabel('Power [W]')
grid on
