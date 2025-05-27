%rappresentazione di B e delle curve 
% isolivello legate a limiti di esposizione, 
% attenzione e obiettivi di qualità a basse 
% frequenze (3,10,100)   NEL PIANO YZ
%  3 FILI (coincidenti con l'asse z)
% NO SFASAMENTO CORRENTI

close all
clc

%1' sorgente (asse z)
xs1=0;
ys1=-5;
%2' sorgente (asse z)
xs2=0;
ys2=0;
%3' sorgente (asse z)
xs3=0;
ys3=+5;

I=400;
curve = [100, 10, 3];

%osservatore (piano yz)
zo=-40:.5:40;
yo=-40:.5:40; %parte da 0 = suolo
[Yo, Zo] = meshgrid (yo, zo);

R1=sqrt((0-xs1).^2+(Yo-ys1).^2);
R2=sqrt((0-xs2).^2+(Yo-ys2).^2);
R3=sqrt((0-xs3).^2+(Yo-ys3).^2);

%grandezze elettromagnetiche
mu0=4*pi*1e-7;
    
    %sorgente 1 
    % (asse z -> B=Bx+By)
B1=mu0*I./(2*pi*R1);
    B1x=B1.*(0-xs1)./R1; 
    B1y=B1.*(Yo-ys1)./R1; 

    %sorgente 2 
    % (asse z -> B=Bx+By)
B2=mu0*I./(2*pi*R2);
    B2x=B2.*(0-xs2)./R2; 
    B2y=B2.*(Yo-ys2)./R2; 

    %sorgente 3 
    % (asse z -> B=Bx+By)
B3=mu0*I./(2*pi*R3);
    B3x=B3.*(0-xs3)./R3; 
    B3y=B3.*(Yo-ys3)./R3; 


Bx=B1x+B2x+B3x;
By=B1y+B2y+B3y;
B=sqrt (Bx.^2+By.^2);
BuT=1e6*abs(B);


figure('Name', 'B');
mesh (yo, zo, BuT);
xlabel ('y');
ylabel('z');
zlabel('B(uT)');
colormap hot;
grid;
set (gca, 'FontSize', 10);
set (findall (gcf, 'type', 'text'), 'FontSize', 10);

figure ('Name', 'Curve Isolivello [3, 10, 100]');
[c, h] = contour (yo, zo, BuT, curve);
xlabel ('y');
ylabel('z');
clabel (c, h);
grid;
set (gca, 'FontSize', 10);
set (findall (gcf, 'type', 'text'), 'FontSize', 10);

hold on
plot (xs1, ys1, 'o', xs2, ys2, 'o',xs3, ys3, 'o');
plot3(xs1, ys1, 0, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k');
plot3(xs2, ys2, 0, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');
plot3(xs3, ys3, 0, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k');