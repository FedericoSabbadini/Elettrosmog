%rappresentazione di B e delle curve 
% isolivello legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (3,10,100)   NEL PIANO XZ
%  1 FILO (coincidente con l'asse x)
%  1 FILO (coincidente con l'asse z)
% NO SFASAMENTO CORRENTE

close all
clc

%1' sorgente (asse x)
zs1=0;
ys1=0;
%2' sorgente (asse z)
xs2=0;
ys2=0;

I=100;
curve = [100, 10, 3];

%osservatore (piano xz)
xo=-40:1:40;
zo=-40:1:40;
[Xo, Zo] = meshgrid (xo, zo);

R1=sqrt((Zo-zs1).^2+(0-ys1).^2);
R2=sqrt((Xo-xs2).^2+(0-ys2).^2);

%grandezze elettromagnetiche
mu0=4*pi*1e-7;
    
    %sorgente 1 
    % (asse x -> B=By+Bz)

B1=mu0*I./(2*pi*R1);
    B1y=B1.*(0-ys1)./R1; % = 0
    B1z=B1.*(Zo-zs1)./R1; %B1=B1z

    %sorgente 2 
    % (asse z -> B=Bx+By)
B2=mu0*I./(2*pi*R2);
    B2y=B2.*(0-ys2)./R2; % = 0
    B2x=B2.*(Xo-xs2)./R2;  %B2=B2x


Bx=B2x;
Bz=B1z;
By=B1y+B2y;
B=sqrt (Bx.^2+Bz.^2+By.^2);
BuT=1e6*abs(B);


figure('Name', 'B');
mesh (xo, zo, BuT);
xlabel ('x');
ylabel('z');
zlabel('B(uT)');
colormap hot;
grid;
set (gca, 'FontSize', 10);
set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Curve Isolivello [3, 10, 100]');
[c, h] = contour (xo, zo, BuT, curve);
xlabel ('x');
ylabel('z');
clabel (c, h);
grid;
set (gca, 'FontSize', 10);
set (findall (gcf, 'type', 'text'), 'FontSize', 10);
