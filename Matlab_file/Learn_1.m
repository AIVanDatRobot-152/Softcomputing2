% Sử dụng thư viện hàm có sẵn của MATLAB => nhanh, chính xác, ít bị lỗi
t = -3:0.5:3;                  % 
x = sin(t);                    % hàm lượng giác
y = exp(t/2) - 1.5;            % hàm mũ
z = abs(x);                    % hàm giá trị tuyệt đối
% ...
plot(t,x,"LineStyle","-","Color","r","LineWidth",1,"Marker","*")