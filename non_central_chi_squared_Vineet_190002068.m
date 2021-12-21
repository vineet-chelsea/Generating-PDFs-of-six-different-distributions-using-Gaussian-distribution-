%%Setting up code for plotting
no_plots = 3
no_samples = 10e7
l=1
color=['r','g','b'];
legendK = cell(1,no_plots);
figure('WindowState', 'maximized');
hold on;


for i=1:no_plots
    pdf2 = non(i, no_samples,l);
    [n, x] = hist(pdf2,1000);
    n_normalized = n/numel(data)/(x(2)-x(1)); %// normalize to unit area
    plot(x, n_normalized/10, color(i)); %// plot line, in red (or change color);
    legendK{i}=strcat(' k=',num2str(i));
end

lg = legend(legendK);
title(lg, "Degrees of freedom");
title('PDF of a non-central Chi squared Distributed random variable');
xlabel('x');
ylabel('f_X(x)');
axis([0 8 0 0.4]); 

print('CHI','-dpng')

%% Function to find non-central Chi-squared distribution 
%% y = sum((Zi)^2) {quoted in report}
%% Zi is Gaussian distributed random variable with mean 0 and variance 1
%% However, Zk has variance 1 and mean sqrt(l)
%% i = 1 to k-1 where k is the degree of freedom
function y = non(k,n,l) %%  k for degrees of freedom and n for the number of samples 

%%We assume that k>0

    y = (sqrt(l)+randn(1,n)).^2; 
    for i=1:k-1
        %%Sum of squares of k independent normally distributed variables
        y = y + randn(1,n).^2;
    end
end
