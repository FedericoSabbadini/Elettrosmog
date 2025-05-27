%rappresentazione di E (intensità) e delle isolinee 
% di radiazione legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (1, 3, 6, 20, 40, 60)  NEL PIANO YZ
%  1 ANTENNA DIRETTIVA (coincidente con l'origine 0,0)

    close all
    clc

%sorgente (origine (0,0))
zs=0;
ys=0;

k=5;
curve = [60, 40, 20, 6, 3, 1];

%osservatore (piano xy)
zo=-20:.1:20;
yo=-20:.1:20; %parte da 0=suolo
[Zo, Yo] = meshgrid (zo, yo);

R=sqrt((Zo-zs).^2+(Yo-ys).^2); %asse x-> coordinate z e y!
THETA=acos((Zo-zs)./R);

%grandezze elettromagnetiche
E=k.*(sin(THETA))./R;

figure('Name', 'E');
mesh (zo, yo, abs(E));
    xlabel ('z');
    ylabel('y');
    zlabel('E(V/m)');
    colormap hot;
    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Isoolinee [60, 40, 20, 6, 3, 1]');
[c, h] = contour (zo, yo, abs(E), curve);
clabel (c, h);
    xlabel ('z');
    ylabel('y');

    grid;
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);

    hold on;
    scatter(0, 0, 10, 'r', 'filled');