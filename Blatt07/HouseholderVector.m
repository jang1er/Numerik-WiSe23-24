function [v,beta] = HouseholderVector(x)
n = length(x);
if n>1
  sigma = x(2:end)'*x(2:end);
  if sigma==0
    beta = 0;
  else
    mu = sqrt(x(1)^2+sigma);
    if x(1)<=0
      tmp = x(1) - mu;
    else
      tmp = -sigma / (x(1) + mu);
    end
    beta = 2*tmp^2/(sigma + tmp^2);
    x(2:end) = x(2:end)/tmp;
  end
  v = [1;x(2:end)];
else
  beta = 0;
  v = 1;
end
