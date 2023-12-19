function [Q1,Q2,R] = qr_HouseholderThin(A)
for j = 1:size(A,2)
  [v,beta(j)] = HouseholderVector(A(j:end,j));
  A(j:end,j:end) = A(j:end,j:end) - v * (beta(j) * (v'*A(j:end,j:end)));
  if j<size(A,1)
    A(j+1:end,j) = v(2:end);
  end
end
  R = A;                    % for householder vectors
  [m, n] = size(A);
  A = eye(size(A,1));       % Q
  for j = size(R,2):-1:1
    v = [1;R(j+1:end,j)];
    A(j:end,j:end) = A(j:end,j:end) - v * (beta(j) * (v'*A(j:end,j:end))); 
  end
  Q1 = A(:,1:n);
  Q2 = A(:,n+1:end);
  R = triu(R); 
end