%rappresentazione della superficie di irradiazione 
% di B legata a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze di 3uT   NELLO SPAZIO XYZ
%  1 FILO (coincidente con l'asse x)
%  1 FILO (coincidente con l'asse z)
% SFASAMENTO CORRENTE

close all
clc

%1' sorgente (asse z)
xs1=-15;
ys1=0;
%2' sorgente (asse z)
xs2=0;
ys2=0;
%3' sorgente (asse z)
xs3=+15;
ys3=0;

I1=100;
I2=I1*exp(1i*2/3*pi);
I3=I1*exp(1i*4/3*pi);
curve = [100, 10, 3];

%osservatore (spazio xyz)
xo=-40:.5:40;
zo=-40:.5:40;
yo=-40:.5:40;
[Xo,Yo, Zo] = meshgrid (xo, yo, zo);

R1=sqrt((Xo-xs1).^2+(Yo-ys1).^2);
R2=sqrt((Xo-xs2).^2+(Yo-ys2).^2);
R3=sqrt((Xo-xs3).^2+(Yo-ys3).^2);

%grandezze elettromagnetiche
mu0=4*pi*1e-7;
    
    %sorgente 1 
    % (asse z -> B=Bx+By)
B1=mu0*I1./(2*pi*R1);
    B1x=B1.*(Xo-xs1)./R1; 
    B1y=B1.*(Yo-ys1)./R1; 

    %sorgente 2 
    % (asse z -> B=Bx+By)
B2=mu0*I2./(2*pi*R2);
    B2x=B2.*(Xo-xs2)./R2; 
    B2y=B2.*(Yo-ys2)./R2; 

    %sorgente 3 
    % (asse z -> B=Bx+By)
B3=mu0*I3./(2*pi*R3);
    B3x=B3.*(Xo-xs3)./R3; 
    B3y=B3.*(Yo-ys3)./R3; 


Bx=B1x+B2x+B3x;
By=B1y+B2y+B3y;
B=sqrt (Bx.^2+By.^2);
BuT=1e6*abs(B);

figure ('Name', 'Superficie di irradiazione 3uT')
isosurface (xo,yo,zo,BuT,9);
    xlabel ('x');
    ylabel('y');
    zlabel('z');
    colormap hot;
    grid;
    legend ('Superficie di irradiazione 3uT');
    set (gca, 'FontSize', 10);
    set (findall (gcf, 'type', 'text'), 'FontSize', 10);