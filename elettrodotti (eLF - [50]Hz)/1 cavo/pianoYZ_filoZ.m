%rappresentazione di B e delle curve 
% isolivello legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (3,10,100)   NEL PIANO YZ
%  1 FILO (coincidente con l'asse z)

    close all
    clear all
    clc

%sorgente (asse z)
xs=0;
ys=0;
I=100;
curve = [100, 10, 3];

%osservatore (piano yz)
yo=0:1:40; %parte da 0=suolo
zo=-40:1:40;
[Yo, Zo] = meshgrid (yo, zo);

R=sqrt((0-xs).^2+(Yo-ys).^2);


%grandezze elettromagnetiche
mu0=4*pi*1e-7;
B=mu0*I./(2*pi*R);
BuT=1e6*abs(B);

figure('Name', 'B');
mesh (yo, zo, BuT);
    xlabel ('y');
    ylabel('z');
    zlabel('B(uT)');
    colormap hot;
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Curve Isolivello [3, 10, 100]');
[c, h] = contour (yo, zo, BuT, curve);
    xlabel ('y');
    ylabel('z');
clabel (c, h);
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);
    hold on;
    scatter(0, 0, 10, 'r', 'filled');