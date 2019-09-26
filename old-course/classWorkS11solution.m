function [ output_args ] = plotItAs( x,y,plotType )
% Solution for class work S11
%   

switch plotType
    case 'plot'
        plot(x,y,'-.k')
        errorbar(x,y,y/10,'.')
    case 'bar'
        bar(x,y,'g')
        errorbar(x,y,y/10,'.')
    case 'pie'
        pie(x,y)
    case 'scatter'
        scatter(x,y)
        errorbar(x,y,y/10,'.')
end

