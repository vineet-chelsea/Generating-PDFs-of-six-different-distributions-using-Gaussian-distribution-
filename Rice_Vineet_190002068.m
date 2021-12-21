%%Setting up code for plotting
no_plots = 3
no_samples = 10e7
color=['r','g','b'];
legendK = cell(1,no_plots);
figure('WindowState', 'maximized');
hold on;


for i=1:no_plots
    pdf3 = rice(i, no_samples);
    [n, x] = hist(pdf3,1000);
    n_normalized = n/numel(data)/(x(2)-x(1)); %// normalize to unit area
    plot(x, n_normalized/10, color(i)); %// plot line, in red (or change color);
    legendK{i}=strcat(' k=',num2str(i));
end

lg = legend(legendK);
title(lg, "Shape factor");
title('PDF of a Rice Distributed random variable');
xlabel('x');
ylabel('f_X(x)');


print('CHI','-dpng')

%% Function to find rician distribution 
%% y = |a+jb| {quoted in report}
%% a,b are Gaussian distributed randomn variable 
%% with variance 1/2*(1+k) and mean as square root of k/2(k+1)
function y = rice(k,n) %%  k shape factor and n for the number of samples 

%%We assume that k>0 and total power to be 1
l1 = sqrt(k/(2*(k+1)));
l2 = sqrt(1/(2*(k+1))); 
y = (l2*randn(1,n)+l1)+1i*(l2*randn(1,n)+l1);
y = abs(y);

   
end
