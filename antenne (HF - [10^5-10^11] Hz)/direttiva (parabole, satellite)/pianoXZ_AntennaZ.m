%rappresentazione di E (intensità) e delle isolinee 
% di radiazione legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (1, 3, 6, 20, 40, 60)  NEL PIANO XZ
%  1 ANTENNA DIRETTIVA (coincidente con l'origine 0,0)

    close all
    clc

%sorgente (origine (0,0))
zs=0;
xs=0;

k=5;
curve = [60, 40, 20, 6, 3, 1];

%osservatore (piano xz)
zo=-20:.1:20;
xo=-20:.1:20; %parte da 0=suolo
[Zo, Xo] = meshgrid (zo, xo);

R=sqrt((Zo-zs).^2+(Xo-xs).^2); %asse x-> coordinate z e x!
THETA=acos((Zo-zs)./R);

%grandezze elettromagnetiche
E=k.*(sin(THETA))./R;

figure('Name', 'E');
mesh (zo, xo, abs(E)); 
    xlabel ('z');
    ylabel('x');
    zlabel('E(V/m)');
    colormap hot;
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Isoolinee [60, 40, 20, 6, 3, 1]');
[c, h] = contour (zo, xo, abs(E), curve);
clabel (c, h);
    xlabel ('z');
    ylabel('x');

    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

    hold on;
    scatter(0, 0, 10, 'r', 'filled');