function TWx = TWV(x)
    N = length(x);
    TWx = zeros(N, N);
    for n = 1:N
        for m = 1:N
            sum_val = 0;
            for k = -(N-1)/2:(N-1)/2
                if (n+k >= 1 && n-k >= 1 && n+k <= N && n-k <= N)
                    sum_val = sum_val + x(n+k)*conj(x(n-k))*exp(4*pi*1i*k*m/N);
                end
            end
            TWx(n, m) = 2/N * sum_val;
        end
    end
end



