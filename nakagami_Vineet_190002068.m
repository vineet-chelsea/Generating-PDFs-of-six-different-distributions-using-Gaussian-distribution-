%%Setting up code for plotting
no_plots = 3
no_samples = 10e7
l=3 %%spread
color=['r','g','b'];
legendK = cell(1,no_plots);
figure('WindowState', 'maximized');
hold on;


for i=1:no_plots
    pdf2 = nakagami(i, no_samples,l);
    [n, x] = hist(pdf2,1000);
    n_normalized = n/numel(data)/(x(2)-x(1)); %// normalize to unit area
    plot(x, n_normalized/10, color(i)); %// plot line, in red (or change color);
    legendK{i}=strcat(' k=',num2str(i));
end

lg = legend(legendK);
title(lg, "shape factor");
title('PDF of a Nakagami-m Distributed random variable with spread 3');
xlabel('x');
ylabel('f(x)');


print('Nakagami','-dpng')

%% Function to find nakagami-m distribution 
%% {quoted in report}
%% Zi is Gaussian distributed random variable with mean 0 and variance 1
%% w>0
%% i = 1 to 2m
function y = nakagami(m,n,w) %%  k for degrees of freedom and n for the number of samples 

%% assumptions include 2m belongs to Z
%% w is positive and real
y=0;
    for j=1:2*m
        y= y + randn(1,n).^2;
    end
    y=sqrt(y); 
    %%chi to nakagami_m
    y=sqrt(w/(2*m))*y;
end