function [A,R] = qr_Householder(A)
for j = 1:size(A,2)
  [v,beta(j)] = HouseholderVector(A(j:end,j));
  A(j:end,j:end) = A(j:end,j:end) - v * (beta(j) * (v'*A(j:end,j:end)));
  if j<size(A,1)
    A(j+1:end,j) = v(2:end);
  end
end
if nargout == 2
  R = A;                    % for householder vectors
  A = eye(size(A,1));       % Q
  for j = size(R,2):-1:1
    v = [1;R(j+1:end,j)];
    A(j:end,j:end) = A(j:end,j:end) - v * (beta(j) * (v'*A(j:end,j:end))); 
  end
  R = triu(R); 
end