%rappresentazione di E (intensità) e delle isolinee 
% di radiazione legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (1, 3, 6, 20, 40, 60)  NEL PIANO YZ (analogo per XZ e XY)
%  1 ANTENNA DIRETTIVA 'particolare'(coincidente con l'origine 0,0)

    close all
    clc

%sorgente (origine (0,0))
ys=0;
xs=0;

k=4;
valore=6;

%osservatore (piano yx)
yo=-20:.1:20; %parte da 0=suolo
xo=-20:.1:20;
[ Yo, Xo] = meshgrid ( yo, xo);

R=sqrt((Yo-ys).^2+(Xo-xs).^2); 
THETA=acos((0)./R);
PHI = asin(((Yo-ys)./R)./sin(THETA));

%grandezze elettromagnetiche
E=k.*sin(THETA).*sin(PHI)./R;

figure('Name', 'E');
mesh (xo, yo, abs(E));
    xlabel ('x');
    ylabel('y');
    zlabel('E(V/m)');
    colormap hot;
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Isoolinee [60, 40, 20, 6, 3, 1]');
[c, h] = contour (xo, yo, abs(E), [60, 40, 20, 6, 3, 1]);
clabel (c, h);
    xlabel ('x');
    ylabel('y');

    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

    hold on;
    scatter(0, 0, 10, 'r', 'filled');