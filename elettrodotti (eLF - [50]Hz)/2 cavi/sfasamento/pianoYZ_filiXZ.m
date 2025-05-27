%rappresentazione di B e delle curve 
% isolivello legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (3,10,100)   NEL PIANO YZ
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

%osservatore (piano yz)
zo=-40:1:40;
yo=0:1:40; % 0 = dal suolo 
[Zo, Yo] = meshgrid (zo, yo);

R1=sqrt((Zo-zs1).^2+(Yo-ys1).^2);
R2=sqrt((0-xs2).^2+(Yo-ys2).^2);

%grandezze elettromagnetiche
mu0=4*pi*1e-7;
    
    %sorgente 1 
    % (asse x -> B=By+Bz)

B1=mu0*I./(2*pi*R1);
    B1y=B1.*(Yo-ys1)./R1; % = 0
    B1z=B1.*(Zo-zs1)./R1; %B1=B1z

    %sorgente 2 
    % (asse z -> B=Bx+By)
B2=mu0*I./(2*pi*R2);
    B2y=B2.*(Yo-ys2)./R2; % = 0
    B2x=B2.*(0-xs2)./R2;  %B2=B2x


Bx=B2x;
Bz=B1z;
By=B1y+B2y;
B=sqrt (Bx.^2+Bz.^2+By.^2);
BuT=1e6*abs(B);


figure('Name', 'B');
mesh (zo, yo, BuT);
xlabel ('z');
ylabel('y');
zlabel('B(uT)');
colormap hot;
grid;
set (gca, 'FontSize', 10);
set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Curve Isolivello [3, 10, 100]');
[c, h] = contour (zo, yo, BuT, curve);
xlabel ('z');
ylabel('y');
clabel (c, h);
grid;
set (gca, 'FontSize', 10);
set (findall (gcf, 'type', 'text'), 'FontSize', 10);
