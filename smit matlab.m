x=-5:0.5:5;
y1=x.^2;
y2=x.^3;
y3=exp(x);
y4=sin(x).*cos(x);
plot(x, y1, 'b-');
hold on;
plot(x, y2, "r");
plot(x, y3, "g");
plot(x, y4, "p");
xlabel('x');
ylabel('y');