%%Setting up code for plotting
no_plots = 3
no_samples = 10e7
l=1
color=['r','g','b'];
legendK = cell(1,no_plots);
figure('WindowState', 'maximized');
hold on;


for i=1:no_plots
    pdf2 = gamma(i, no_samples,l);
    [n, x] = hist(pdf2,1000);
    n_normalized = n/numel(data)/(x(2)-x(1)); %// normalize to unit area
    plot(x, n_normalized/10, color(i)); %// plot line, in red (or change color);
    legendK{i}=strcat(' k=',num2str(i));
end

lg = legend(legendK);
title(lg, "shape factor");
title('PDF of a Gamma Distributed random variable');
xlabel('x');
ylabel('f_X(x)');
axis([0 10 0 1.5]); 

print('gamma','-dpng')

%% Function to find gamma distribution 
%% {quoted in report}
%% Zi is Gaussian distributed random variable with mean 0 and variance 1
%% alpha = shape factor and beta = scale factor of y
%% i = 1 to 2 alpha
function y = gamma(alpha,n,beta) %%  k for degrees of freedom and n for the number of samples 

%%We assume that k>0
y=0;
    for j=1:2*alpha
        y =  y + randn(1,n).^2;
    end 
    y = (1/(2*beta))*y;
end
