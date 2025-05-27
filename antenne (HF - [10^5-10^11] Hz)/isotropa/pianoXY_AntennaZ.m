%rappresentazione di E (intensità) e delle isolinee 
% di radiazione legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (1, 3, 6, 20, 40, 60)  NEL PIANO XY (analogo per XZ e YZ)
%  1 ANTENNA ISOTROPA (coincidente con l'origine 0,0)

    close all
    clc

%sorgente (origine (0,0))
xs=0;
ys=0;

k=5;
curve = [60, 40, 20, 6, 3, 1];

%osservatore (piano xy)
xo=-20:.1:20;
yo=-20:.1:20; 
[Xo, Yo] = meshgrid (xo, yo);

R=sqrt((Xo-xs).^2+(Yo-ys).^2); %asse z-> coordinate x e y!


%grandezze elettromagnetiche
E=k./R;

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
[c, h] = contour (xo, yo, abs(E), curve);
clabel (c, h);
    xlabel ('x');
    ylabel('y');

    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

    hold on;
    scatter(0, 0, 10, 'r', 'filled');