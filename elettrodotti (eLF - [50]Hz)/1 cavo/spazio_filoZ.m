%rappresentazione della superficie di irradiazione 
% di B legata a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze di 3uT   NELLO SPAZIO XYZ
%  1 FILO (coincidente con l'asse z)

    close all
    clc

%sorgente (asse z)
xs=0;
ys=0;
zs=0;
I=100;
curve = [100, 10, 3];

%osservatore (spazio xyz)
xo=-40:.5:40;
yo=-40:.5:40; 
zo=-40:.5:40;
[Xo, Yo, Zo] = meshgrid (xo, yo, zo);

R=sqrt((Xo-xs).^2+(Yo-ys).^2+(Zo-zs).^2); 


%grandezze elettromagnetiche
mu0=4*pi*1e-7;
B=mu0*I./(2*pi*R);
BuT=1e6*abs(B);


figure ('Name', 'Superficie di irradiazione 3uT')
isosurface (xo,yo,zo,BuT,3);
    xlabel ('x');
    ylabel('y');
    zlabel('z');
    colormap hot;
    grid;
    legend ('Superficie di irradiazione 63T');
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);