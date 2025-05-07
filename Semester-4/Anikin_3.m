% %% Исходные данные
% x = [0.35 0.41 0.47 0.51 0.56 0.64];
% y = [2.73951 2.3008 1.96464 1.78776 1.59502 1.34310];
% xt = 0.552;
% %% Вычисление разделенных разностей
% l = length(x);
% M = zeros(l, l+1);
% M(:,1) = x';
% M(:,2) = y';
% for c = 1:5
%  M(c,3) = (M(c+1,2) - M(c,2)) / (x(c+1) - x(c));
% end;
% for c = 1:4
%  M(c,4) = (M(c+1,3) - M(c,3)) / (x(c+2) - x(c));
% end;
% 21
% for c = 1:3
%  M(c,5) = (M(c+1,4) - M(c,4)) / (x(c+3) - x(c));
% end;
% for c = 1:2
%  M(c,6) = (M(c+1,5) - M(c,5)) / (x(c+4) - x(c));
% end;
% M(1,7) = (M(2,6) - M(1,6)) / (x(6) - x(1));
% display('Матрица разделенных разностей')
% display(M);

%Лабараторная работа №2
%t = eye(5,5)
% M=linspace(4,6,4)
 %L=logspace(1,2,14)
 %rand(3)
 % X=rand(2000,10); Y=rand(2000,10); plot(X,Y,'.')
 
 %Лабараторная работа №3
%выполнил Аникин Дмитрий

%S=sparse(sprandn(20,30,0.9));spy(S,'.r',6)
% B=bucky;p=symamd(B); 
% R=B(p,p);
% subplot(1,2,1),spy(B);subplot(1,2,2),spy(R)


% B=bucky;
% p=symrcm(B);
% R=B(p,p);
% subplot(1,2,1),spy(B);subplot(1,2,2),spy(R)


%spy(B^3)

% 
% F=wilkinson(150);
% condest(sparse(F))

%normest(sparse(F))

% n = input('Введите кол-во строк ')
% m = input('Введите кол-во стобцов ')
% A = rand(n,m)


% [B,v]=bucky;
% k = 1:30;
% gplot(B(k,k),v);
% axis square
% for j = 1:30, text(v(j,1),v(j,2), int2str(j));
% end

