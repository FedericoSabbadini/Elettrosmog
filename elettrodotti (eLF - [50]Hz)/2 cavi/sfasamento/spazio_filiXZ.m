%rappresentazione della superficie di irradiazione 
% di B legata a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze di 3uT   NELLO SPAZIO XYZ
%  1 FILO (coincidente con l'asse x)
%  1 FILO (coincidente con l'asse z)
% SFASAMENTO CORRENTE

close all
clc

%1' sorgente (asse x)
zs1=0;
ys1=0;
%2' sorgente (asse z)
xs2=0;
ys2=0;

I1=100;
I2=I1*exp(1i*1/2*pi);
curve = [100, 10, 3];

%osservatore (piano xz)
xo=-40:1:40;
zo=-40:1:40;
yo=-40:1:40;
[Xo,Yo, Zo] = meshgrid (xo, yo, zo);

R1=sqrt((Zo-zs1).^2+(Yo-ys1).^2);
R2=sqrt((Xo-xs2).^2+(Yo-ys2).^2);

%grandezze elettromagnetiche
mu0=4*pi*1e-7;
    
    %sorgente 1 
    % (asse x -> B=By+Bz)
B1=mu0*I1./(2*pi*R1);
    B1y=B1.*(Yo-ys1)./R1; 
    B1z=B1.*(Zo-zs1)./R1; 

    %sorgente 2 
    % (asse z -> B=Bx+By)
B2=mu0*I2./(2*pi*R2);
    B2y=B2.*(Yo-ys2)./R2;
    B2x=B2.*(Xo-xs2)./R2;  


Bx=B2x;
Bz=B1z;
By=B1y+B2y;
B=sqrt (Bx.^2+Bz.^2+By.^2);
BuT=1e6*abs(B);

figure ('Name', 'Superficie di irradiazione 6uT')
isosurface (xo,yo,zo,BuT,6);
    xlabel ('x');
    ylabel('y');
    zlabel('z');
    colormap hot;
    grid;
    legend ('Superficie di irradiazione 6uT');
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);