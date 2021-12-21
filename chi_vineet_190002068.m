%%Setting up code for plotting
no_plots = 3
no_samples = 10e7
color=['r','g','b'];
legendK = cell(1,no_plots);
figure('WindowState', 'maximized');
hold on;


for i=1:nPlots
    pdf1 = Chi(i, no_samples);
    [n, x] = hist(pdf1,100);
    n_normalized = n/numel(data)/(x(2)-x(1)); %// normalize to unit area
    plot(x, n_normalized/10, color(i)); %// plot line, in red (or change color);
    legendK{i}=strcat(' k=',num2str(i));
end

lg = legend(legendK);
title(lg, "Degrees of freedom");
title('PDF of a Chi Distributed random variable');
xlabel('x');
ylabel('f_X(x)');

print('CHI','-dpng')

%% Function to find Chi distribution 
%% y = sqrt( sum((Zi)^2) ) {quoted in report}
%% Zi is Gaussian distributed randomn variable 
%% i = 1 to k where k is the degree of freedom
function y = Chi(k,n) %%  k for degrees of freedom and n for the number of samples 

%%We assume that k>0

    y =0;
    for i=1:k
        %%Sum of squares of k independent normally distributed variables
        y = y + randn(1,n).^2;
    end
    y =sqrt(y); %%Taking square root
end

