%rappresentazione di B (intensità) e delle curve 
% isolivello legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (3,10,100)   NEL PIANO XY
%  1 FILO (coincidente con l'asse z)

    close all
    clc

%sorgente (asse z)
xs=0;
ys=0;
I=100;
curve = [100, 10, 3];

%osservatore (piano xy)
xo=-40:1:40;
yo=-40:1:40; %parte da 0=suolo
[Xo, Yo] = meshgrid (xo, yo);

R=sqrt((Xo-xs).^2+(Yo-ys).^2); %asse z-> coordinate x e y!


%grandezze elettromagnetiche
mu0=4*pi*1e-7;
B=mu0*I./(2*pi*R);
BuT=1e6*abs(B);

figure('Name', 'B');
mesh (xo, yo, BuT);
    xlabel ('x');
    ylabel('y');
    zlabel('B(uT)');
    colormap hot;
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Curve Isolivello [3, 10, 100]');
[c, h] = contour (xo, yo, BuT, curve);
clabel (c, h);
    xlabel ('x');
    ylabel('y');

    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

    hold on;
    scatter(0, 0, 10, 'r', 'filled');