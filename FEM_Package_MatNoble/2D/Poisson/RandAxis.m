function [ X, Y ] = RandAxis(left, right, top, bottom, nx, ny, px, py)
%% 释义 
%   nx：x方向单元个数
%   ny：y方向单元个数
%   px：x方向扭曲程度 （0,0.5）
%   py：y方向扭曲程度 （0,0.5）

%% 主函数
%   按随机数生成网格坐标
    n1x=nx*nx;         Hx=sqrt(1/n1x);    % x方向平均间距
    n1y=ny*ny;         Hy=sqrt(1/n1y);    % y方向平均间距
    n2x=nx+1;          n2y=ny+1;         
    X=zeros(n2y,n2x);  Y=zeros(n2y,n2x);  % 给 X,Y 分配存储空间
%   产生随机坐标
    for i=1:n2y
        for j=1:n2x
            X(i,j)=(j-1)*Hx+(2*rand(1,1)-1)*px*Hx;
            Y(i,j)=(i-1)*Hy+(2*rand(1,1)-1)*py*Hy;
        end
    end
%   边缘化
    for i=1:n2y
        X(i,1)=0;X(i,nx+1)=1;
    end
    for j=1:n2x
        Y(1,j)=0;Y(ny+1,j)=1;
    end
    % mapping
    proportion1 = right - left;
    X = proportion1 * X + left;
    proportion2 = top - bottom;
    Y = proportion2 * Y + bottom;
    
%  
end