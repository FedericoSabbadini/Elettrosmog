%rappresentazione di E (intensità) e delle isolinee 
% di radiazione legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (1, 3, 6, 20, 40, 60)  NEL PIANO xz 
%  1 ANTENNA DIRETTIVA 'particolare'(coincidente con l'origine 0,0)

    close all
    clc

%sorgente (origine (0,0,0))
xs=0;
zs=0;

k=4;
valore=6;

%osservatore (spazio xyz)
xo=-20:.1:20;
zo=-20:.1:20;
[Xo, Zo] = meshgrid (xo, zo);

R=sqrt((Xo-xs).^2+(Zo-zs).^2); 

THETA=acos((Zo-zs)./R);
PHI = acos(((Xo-xs)./R)./sin(THETA));


%grandezze elettromagnetiche
E=k.*sin(THETA).*cos(PHI)./R;

figure('Name', 'E');
mesh (xo, zo, abs(E));
    xlabel ('x');
    ylabel('z');
    zlabel('E(V/m)');
    colormap hot;
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Isoolinee [60, 40, 20, 6, 3, 1]');
[c, h] = contour (xo, zo, abs(E), [60, 40, 20, 6, 3, 1]);
clabel (c, h);
    xlabel ('x');
    ylabel('z');

    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

    hold on;
    scatter(0, 0, 10, 'r', 'filled');

    