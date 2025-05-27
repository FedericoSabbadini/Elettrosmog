%rappresentazione della superficie di irradiazione
% del campo E pari a 6 V/m   NELLO SPAZIO XYZ
%  1 ANTENNA DIRETTIVA 'particolare' (coincidente con l'origine 0,0,0)

    close all
    clc

%sorgente (origine (0,0,0))
xs=0;
ys=0;
zs=0;

k=4;
valore=6;

%osservatore (spazio xyz)
xo=-20:.1:20;
yo=-20:.1:20; 
zo=-20:.1:20;
[Xo, Yo, Zo] = meshgrid (xo, yo, zo);

R=sqrt((Xo-xs).^2+(Yo-ys).^2+(Zo-zs).^2); 

THETA=acos((Zo-zs)./R);
PHI = asin(((Yo-ys)./R)./sin(THETA));

%grandezze elettromagnetiche
E=k.*sin(4*THETA).*sin(4*PHI)./R;

figure ('Name', 'Superficie di irradiazione 6V/m')
isosurface (xo,yo,zo,abs(E),valore);
    xlabel ('x');
    ylabel('y');
    zlabel('z');
    colormap hot;
    grid;
    legend ('Superficie di irradiazione 6V/m');
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);
